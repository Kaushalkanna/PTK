package Categories;
import java.io.Serializable;
import java.util.ArrayList;


public class Products implements Serializable{
	
/**
	 * 
	 */
	//private static final long serialVersionUID = 5307288578273879552L;
		private static final long serialVersionUID = 1L;
	public ArrayList<Item> itemList = new ArrayList<Item>();

	public void addItem(Item i){
		itemList.add(i);
	}

	public ArrayList<Item> getItemList() {
		return itemList;
	}

	public void setItemList(ArrayList<Item> itemList) {
		this.itemList = itemList;
	}
	
	public Item getItemFromList(String itemName){
		for(int i=0;i<itemList.size() ; i++){
			Item item = itemList.get(i);
			if( item.getName().contains(itemName) || item.getName().equals(itemName) ){
				return item;
			}
		}
		return null;
		
	}

	public void deleteItem(int i) {
		itemList.remove(i);
	}

	public int getItemIndexFromList(String itemName) {
		int index = -1;
		for(int i=0;i<itemList.size() ; i++){
			Item item = itemList.get(i);
			if( item.getName().contains(itemName) || item.getName().equals(itemName) ){
				return i;
			}
		}
		return index;
	}
}
