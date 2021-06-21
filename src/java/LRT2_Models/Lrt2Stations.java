/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LRT2_Models;
import java.util.*;

/**
 *
 * @author Kirby Wenceslao
 */
public class Lrt2Stations 
{
    ArrayList<String> Stations;
    
    public Lrt2Stations()
    {
        Stations = new ArrayList<>();
        setStations();
    }
    //setter
    public void setStations()
    {
        Stations.add("Recto");
        Stations.add("Legarda");
        Stations.add("Pureza");
        Stations.add("V.Mapa");
        Stations.add("J.Ruiz");
        Stations.add("Gilmore");
        Stations.add("Betty Go");
        Stations.add("Cubao");
        Stations.add("Anonas");
        Stations.add("Katipunan");
        Stations.add("Santolan");
        Stations.add("Marikina");
        Stations.add("Antipolo");
    }
    
    //getter
    public ArrayList getStations()
    {
        return Stations;
    }
    
}
