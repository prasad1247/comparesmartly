/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.matcher;

/**
 *
 * @author Asus
 */
public class NewClass {
 
 
public static void main(String[] args) {
new NewClass().go( 1,"hi");
new NewClass().go( 2,"hi", "world");
new NewClass().go( 2,"hi", "world","asdasd");
new NewClass().go( 2,"hi", "world","asdasd","asdas");

}
public void go( int x,String... y) {
System.out.print(y[y.length - 1] + " ");
}
}

