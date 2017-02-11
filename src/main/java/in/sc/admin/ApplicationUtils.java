/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.sc.admin;

/**
 *
 * @author PRASAD
 */
public class ApplicationUtils {

    public static boolean isBlank(Object str) {
        if (str == null || str.toString().trim().length() == 0) {
            return true;
        }
        return false;
    }

    public static Object printIfBlank(Object str) {
        if (str == null || str.toString().trim().length() == 0) {
            return "";
        }
        return str;
    }

    public static String toTitleCase(String givenString) {
        StringBuffer sb = new StringBuffer();
        if (givenString != null && givenString.length() > 1) {
            givenString = givenString.toLowerCase();
            String[] arr = givenString.split(" ");

            try {
                for (int i = 0; i < arr.length; i++) {
                    if (arr[i].length() > 0) {
                        sb.append(Character.toUpperCase(arr[i].charAt(0)))
                                .append(arr[i].substring(1)).append(" ");
                    }
                }
            } catch (Exception e) {
                System.out.println("givenString " + givenString);
                e.printStackTrace();
            }
        }
        return sb.toString().trim();
    }

    public static void main(String[] args) {
        String str = "sony-xperia-z5-premium-32gb-phone-price-in-nigeria";
        System.out.println(toTitleCase(str.replace("-", " ")));;
    }
}
