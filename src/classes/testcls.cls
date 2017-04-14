public class testcls{
public class Car {
    public String make;
    public String year;
}

public static void parse() {        
    Car c = (Car)JSON.deserialize(
        '{"make":"SFDC","year":"2020","month": "jan"}',
        Car.class);
    System.assertEquals(c.make, 'SFDC');
    System.assertEquals(c.year, '2020');
}
}