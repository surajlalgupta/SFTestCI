public class linkedList{
    public Node head;
    public Integer size;
    public Node tail;
    public linkedList(){
        head = null;
        size = 0;
    }
    public void add(String str, Integer num){
        node n = new node(str, num);
        node temp = this.head;
        if (this.head == null){
            this.head = n;
        }
        else{
            while(temp.next != null){
                temp = temp.next;
            }
            temp.next = n;
        }
        this.size++;
    }
    public void swap(node n, node m){
        String tempStr = n.str;
        Integer tempNum = n.num;
        n.str = m.str;
        n.num = m.num;
        m.str = tempStr;
        m.num = tempNum;
    }
    public void preview(){
        node temp = this.head;
        while (temp.next != null){
            system.debug(String.valueOf(temp.str)+' '+String.valueOf(temp.num)+'\n');
            temp = temp.next;
        }
        system.debug(String.valueOf(temp.str)+' '+String.valueOf(temp.num)+'\n');
    }
}