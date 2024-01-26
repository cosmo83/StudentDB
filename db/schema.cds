namespace com.satinfotech.studentdb;


entity Student {
    @title: 'Student ID'
    key studentid: String(5);
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
    @title: 'Age'
    virtual age: Integer @Core.Computed;
}

@cds.persistence.skip
entity Gender {
    @title: 'code'
    key code: String(1);
    @title: 'Description'
    description: String(10);
}