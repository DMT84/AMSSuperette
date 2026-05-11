package AMS;

import data.IData;
import data.fieldType;

import java.util.HashMap;

public class Produit implements IData {
    private int id;
    private String nom;
    private String description;
    private String categorie;
    private int prix;

    private String values;
    private HashMap<String, fieldType> map = new HashMap<>();

    public Produit(int id, String nom, String description, String categorie, int prix) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.categorie = categorie;
        this.prix = prix;
        getStruct();
    }

    @Override
    public void getStruct() {
        map.put("id", fieldType.INTEGER);
        map.put("nom", fieldType.STRING);
        map.put("description", fieldType.STRING);
        map.put("categorie", fieldType.STRING);
        map.put("prix", fieldType.DOUBLE);
       
    }

    @Override
    public String getValues() {
        return values;
    }

    @Override
    public HashMap<String, fieldType> getMap() {
        return map;
    }

    @Override
    public boolean check(HashMap<String, fieldType> tableStruct) {
        return map.equals(tableStruct);
    }
}
