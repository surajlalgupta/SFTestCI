public class BusScheduleCache{
    private Cache.OrgPartition part;
    public BusScheduleCache(){
        part = Cache.org.getPartition('local.BusSchedule');
    }
    public void putSchedule(String busLine, Time[] schedule){
        part.put('schedule', schedule);
        part.put('busLine', busLine);
    }
    public Time[] getSchedule(String busLine){
        Time[] t = (Time[])part.get('schedule');
        if (t != null && t.size() > 0)
            return t;
        else{
            Time[] ts = new Time[]{};
            ts.add(Time.newinstance(8,0,0,0));
            ts.add(Time.newinstance(17,0,0,0));
            return ts;
        }
    }
}