/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.matcher;

import java.util.LinkedList;

/**
 *
 * @author PRASAD
 */
public class WordMatch {

    public static void main(String[] args) {
        String pName = "Dell 11 3148 (314834500iST) Laptop (Core i3 4th Gen/4 GB/500 GB/Windows 8 1)#32 Inch#HD ready";
        String toName = "Dell Inspiron Core i3 - (4 GB/500 GB HDD/Windows 8.1) 314834500iST 3148 2 in 1 Laptop(11.49 inch, 1.39 kg) ";
        compareLapPNames("11 3148 (314834500iST)", "4 GB", pName, toName);
        String aa="HD ready, 1366 x 768 Pixels";
        String [] ss=aa.split(",")[1].split(" ");
        System.out.println(""+ss[1]+"  "+ss[3]);
        
    }

    public static boolean comparePNamesBoolean(String pDetails, String toName) {
        boolean found = false;
        String pName = GeneratorUtil.simplifiedString(pDetails.split("#")[0]);
        String uToName = createUnique(toName.toLowerCase());
        toName = GeneratorUtil.simplifiedString(toName);
        String specA[] = pDetails.split("#")[1].split(",");
        if (pName.equals(uToName)) {
            for (int i = 0; i < specA.length; i++) {
                if (toName.contains(specA[i].trim()) || toName.contains(specA[i].replace(" ", ""))) {
                    found = true;
                }
            }
        }//
        return found;
    }

    public static double comparePNames(String pDetails, String toName) {

        String pName = GeneratorUtil.simplifiedString(pDetails.split("#")[0]);
        String pwords[] = pName.split(" ");
        String simplToName = createUnique(toName.toLowerCase());
        String twords[] = simplToName.split(" ");
        toName = GeneratorUtil.simplifiedString(toName);
        StringBuilder pBuild = new StringBuilder();
        StringBuilder tBuild = new StringBuilder();
        LinkedList ls = new LinkedList();
        double prel = 0, trel = 0;
        int ptot = pwords.length * 2, ttot = twords.length * 2;
        if (toName.equals(pName)) {
            prel = ptot;
        } else {

            if (toName.equals(pName)) {
                prel = ptot;
            }

            for (int i = 0; i < pwords.length; i++) {
                String abc = pBuild.append(pwords[i]).toString();
                if (toName.contains(abc)) {
                    prel += 2;
                } else if (simplToName.contains(pwords[i]) && !pwords[i].equals("gb")) {
                    prel += 1;
                } else if (toName.contains(pwords[i])) {
                    prel += 0.1;
                }
                pBuild.append(" ");
            }
            for (int i = 0; i < twords.length; i++) {
                String abc = tBuild.append(twords[i]).toString();
                if (pName.contains(abc)) {
                    trel += 2;
                } else if (pName.contains(twords[i])) {
                    trel++;
                } else {
                    trel -= 0.1;
                }
                tBuild.append(" ");
            }
            String specA[] = pDetails.split("#")[1].split(",");
            for (int i = 0; i < specA.length; i++) {
                if (toName.contains(specA[i].trim()) || toName.contains(specA[i].replace(" ", ""))) {
                    prel += 0.01;
                }
            }
//            System.out.println(tot + " " + rel);
        }
        return (prel * 10) + (trel * 10);
    }

    public static double comparePNames(String f1, String f2, String pDetails, String toName) {

        String pName = GeneratorUtil.simplifiedString(pDetails.split("#")[0]);
        String pwords[] = pName.split(" ");
        String simplToName = createUnique(toName.toLowerCase());
        String twords[] = simplToName.split(" ");
        toName = GeneratorUtil.simplifiedString(toName);
        StringBuilder pBuild = new StringBuilder();
        StringBuilder tBuild = new StringBuilder();
        LinkedList ls = new LinkedList();
        double prel = 0, trel = 0;
        double ptrans =0;
        int ptot = pwords.length * 2, ttot = twords.length * 2;
        if (toName.equals(pName)) {
            prel = ptot;
        } else {

            if (toName.equals(pName)) {
                prel = ptot;
            }

            for (int i = 0; i < pwords.length; i++) {
                String abc = pBuild.append(pwords[i]).toString();
                if (toName.contains(abc)) {
                    prel += 2;
                } else if (simplToName.contains(pwords[i]) && !pwords[i].equals("gb")) {
                    prel += 1;
                } else if (toName.contains(pwords[i])) {
                    prel += 0.1;
                }
                pBuild.append(" ");
            }
            for (int i = 0; i < twords.length; i++) {
                String abc = tBuild.append(twords[i]).toString();
                if (pName.contains(abc)) {
                    trel += 2;
                } else if (pName.contains(twords[i])) {
                    trel++;
                } else {
                    trel -= 0.1;
                }
                tBuild.append(" ");
            }
//            String specA[] = pDetails.split("#")[1].split(",");
//            for (int i = 0; i < specA.length; i++) {
//                if (toName.contains(specA[i].trim()) || toName.contains(specA[i].replace(" ", ""))) {
//                    prel += 0.01;
//                }
//            }
             ptrans = (prel * 10) + (trel * 10);
//            System.out.println(" before " + ptrans);
             f1=f1.toLowerCase();
             f2=f2.toLowerCase();
            if (toName.contains("samsung")) {
                f1 = f1.substring(2, f1.length() - 2);
            }
            if (toName.contains(f1)) {
                ptrans += 100;
            }
            if (toName.contains(f2)) {
                ptrans += 50;
            }
//            System.out.println("after" + prel);
        }
        System.out.println("p  "+ptrans);
        return ptrans;
    }
    public static double compareLapPNames(String f1, String f2, String pDetails, String toName) {

        String pName = GeneratorUtil.simplifiedString(pDetails.split("#")[0]);
        String pwords[] = pName.split(" ");
        String simplToName = createUnique(toName.toLowerCase());
        String twords[] = simplToName.split(" ");
        toName = GeneratorUtil.simplifiedString(toName);
        StringBuilder pBuild = new StringBuilder();
        StringBuilder tBuild = new StringBuilder();
        LinkedList ls = new LinkedList();
        double prel = 0, trel = 0;
        double ptrans =0;
        int ptot = pwords.length * 2, ttot = twords.length * 2;
        if (toName.equals(pName)) {
            prel = ptot;
        } else {

            if (toName.equals(pName)) {
                prel = ptot;
            }

            for (int i = 0; i < pwords.length; i++) {
                String abc = pBuild.append(pwords[i]).toString();
                if (toName.contains(abc)) {
                    prel += 2;
                } else if (simplToName.contains(pwords[i]) && !pwords[i].equals("gb")) {
                    prel += 1;
                } else if (toName.contains(pwords[i])) {
                    prel += 0.1;
                }
                pBuild.append(" ");
            }
            for (int i = 0; i < twords.length; i++) {
                String abc = tBuild.append(twords[i]).toString();
                if (pName.contains(abc)) {
                    trel += 2;
                } else if (pName.contains(twords[i])) {
                    trel++;
                } else {
                    trel -= 0.1;
                }
                tBuild.append(" ");
            }
//            String specA[] = pDetails.split("#")[1].split(",");
//            for (int i = 0; i < specA.length; i++) {
//                if (toName.contains(specA[i].trim()) || toName.contains(specA[i].replace(" ", ""))) {
//                    prel += 0.01;
//                }
//            }
             ptrans = (prel * 10) + (trel * 10);
//            System.out.println(" before " + ptrans);
             f1=f1.toLowerCase();
             f2=f2.toLowerCase();
            if (toName.contains("samsung")) {
                f1 = f1.substring(2, f1.length() - 2);
            }
            String[] f1Arra=f1.split("\\(");
            if (toName.contains(f1Arra[0].trim())) {
                ptrans += 100;
            }
             if (f1Arra.length>1 && toName.contains(f1Arra[1].split("\\)")[0])) {
                ptrans += 100;
            }
            if (toName.contains(f2)) {
                ptrans += 50;
            }
//            System.out.println("after" + prel);
        }
        System.out.println("p  "+ptrans);
        return ptrans;
    }

    public static String createUnique(String pName) {
        pName = pName.split("[-+]+")[0].trim();
        return pName;
    }
}
