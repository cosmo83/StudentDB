namespace com.satinfotech.studentdb;
using { managed, cuid } from '@sap/cds/common';

@assert.unique:{
    studentid:[studentid]
}
entity Student: cuid, managed {
    @title: 'Student ID'
    studentid: String(5);
    @title: 'Gender'
    gender: String(1);
    @title: 'First Name'
    first_name: String(40) @mandatory;
    @title: 'Last Name'
    last_name: String(40) @mandatory;
    @title: 'Email ID'
    email_id: String(100) @mandatory;
    @title: 'Date of Birth'
    dob: Date @mandatory;
    @title: 'Course'
    course: Association to Courses;
    @title: 'Languages Known'
    Languages: Composition of many StudentLanguages on Languages.studentid = $self;
    @title: 'Age'
    virtual age: Integer @Core.Computed;
    @title: 'Is Alumni'
    is_alumni: Boolean default false;
}

entity StudentLanguages: managed,cuid {
    studentid: Association to Student;
    langid: Association to Languages;
}

/*
entity  Books : managed, cuid{
    code: String(5);
    name: String(40);
    description: String(200);
    authors: Composition of many {
        author: Association to Authors;
    };
}

entity Authors: managed, cuid {
    name: String(40);
}
*/

@cds.persistence.skip
entity Gender {
    @title: 'code'
    key code: String(1);
    @title: 'Description'
    description: String(10);
}

entity Courses : cuid, managed {
    @title: 'Code'
    code: String(3);
    @title: 'Description'
    description: String(50);
}


entity Languages: cuid, managed {
    @title: 'Code'
    code: String(2);
    @title: 'Description'
    description: String(20);
}
