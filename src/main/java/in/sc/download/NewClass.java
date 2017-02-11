/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.download;

/**
 *
 * @author PRASAD
 */
public class NewClass {

    public static void main(String[] args) {
        System.out.println(ag());
    }

    public static String ag() {
        try {
            return "Prasad";
        } catch (Exception e) {
            return "vikas";
        } finally {
            return "vikram";
        }

    }

    public synchronized static void staticMethodA() {
            //    doStaticStuff();
    }
    public static void staticMethodB() {
        staticMethodA();
    }
  }

