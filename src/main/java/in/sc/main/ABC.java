/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.main;

import in.sc.main.ABC.Rank;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author PRASAD
 */
public class ABC {

    int number;
    @Resource
    HashMap map;

    ABC(int i) {
        number = i;
    }

    ABC(String s, String t) {
//        this(s + t);
    }

    ABC(ABC s) {
        System.out.println(s);
    }

    public static List reverse(List list) {
        Collections.reverse(list);

        return list;

    }

    enum Rank {

        FIRST(20), SECOND(0), THIRD(8);

        Rank(int value) {
            System.out.println(value);
        }
    }

    public static void main(String[] args) {
        List list = new ArrayList();
        list.add("1");
        list.add("2");
        list.add("3");
        Collections.reverse(list);
        list.iterator();
        for (Object obj : reverse(list)) {
            System.out.print(obj + ", ");
        }

        D x = (D) new D();
        if (x instanceof I) {
            System.out.println("I");
        }
        if (x instanceof J) {
            System.out.println("J");
        }
        if (x instanceof C) {
            System.out.println("C");
        }
        if (x instanceof D) {
            System.out.println("D");
        }
        xyz x1 = new xyz("Test");
        int x2 = 111;

        Rank abc = Rank.FIRST;
        System.out.println("" + abc.SECOND);
        final int j = 2;
        switch (x2) {
            case 1:
                System.out.println("1");
                break;
            case 10:
                System.out.println("10");
                break;
            case j:
                System.out.println("2");
                break;
            case 5:
                System.out.println("5");
                break;
            default:
                System.out.println("Default");
                break;
        }
        String str1 = "lower", str2 = "LOWER", str3 = "UPPER";
        str1.toUpperCase();
        str1.replace("LOWER", "UPPER");
        System.out.println((str1.equals(str2)) + " " + (str1.equals(str3)) + "  " + str1 + "  " + str2 + "  " + str3);
        for (int i = 0; i < 3; i++) {
            System.out.println("" + i);
            switch (i) {
                case 0:
                    break;
                case 1:
                    System.out.println("one");
                case 2:
                    System.out.println("two");
                case 3:
                    System.out.println("three");
            }
        }
        System.out.println("done");
        ABC a=new ABC("a","b");
        ABC b=new ABC(a);
    }

}

interface I {
}

interface J {
}

class C implements I {
}

class D extends C implements J {
}

class xyz extends ABC {

    public xyz(int i) {
        super(1);
    }

    xyz(String s) {
        super(1);
        System.out.println(s);
    }

    public xyz(int i, int b) {
        super(1);
    }

    public interface HeavenlyBody {

        String describe();
    }

    class Star {

        String bodyName;

        public String describe() {
            return "star " + bodyName;
        }
    }

    class Planet extends Star {

        String name;

        public String describe() {
            return "planet " + name + " orbiting star " + bodyName;
        }
    }
}
