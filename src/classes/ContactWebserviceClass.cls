global class ContactWebserviceClass {
    webService static Id makeContact(String lastName) {
        Contact c = new Contact(lastName = lastName);
        insert  c;
        return c.id;
    }
}