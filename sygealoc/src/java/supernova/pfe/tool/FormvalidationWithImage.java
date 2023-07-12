/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package supernova.pfe.tool;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import supernova.pfe.dao.*;

/**
 *
 * @author GIRLS
 */
public class FormvalidationWithImage {

    private static HashMap<String, String> rulesNFields = new HashMap<String, String>();
    private static HashMap<String, String> data;
    private static String error = "";

    public static void setRules(HashMap rulesNFields, HashMap<String, String> data) {
        FormvalidationWithImage.rulesNFields = rulesNFields;
        FormvalidationWithImage.data = data;
    }

    public static boolean run() {
        clearError();
        boolean okay = true;
        for (Map.Entry<String, String> field : FormvalidationWithImage.rulesNFields.entrySet()) {
            String current_value = FormvalidationWithImage.data.get(field.getKey()).trim();
            if(current_value != null){
                current_value = current_value.trim().replace("-", "");
            }
            
            for (String singleRule : field.getValue().replace(",", "").split(" ")) {
                //"required"
                if (singleRule.equals("required")) {
                    if (current_value == null || current_value.isEmpty()) {
                        error += "Le champ " + Lang.get(field.getKey()) + " est obligatoire<br/>";
                        okay = false;
                    }
                }
                
                //is-imma
                if (singleRule.equals("is-imma")) {
                    Pattern ptr = Pattern.compile("^[LO-]+[0-9]{5}$");
                    if (!ptr.matcher(current_value).matches()) {
                        okay = false;
                        error += "Mauvais format de " + Lang.get(field.getKey()) + " (LO-12345)<br/>";
                    }
                }

                //"min=8" | "max=10 | len=22"
                if (current_value != null && current_value.length() > 0) {
                    if (!error.contains(Lang.get(field.getKey()))) {
                        if (singleRule.contains("min") || singleRule.contains("max") || singleRule.contains("len")) {
                            String[] keys = singleRule.split("=");
                            if (keys[0].equals("min")) {
                                if (current_value.length() < Integer.parseInt(keys[1])) {
                                    error += "Le champ " + Lang.get(field.getKey()) + " doit faire au moins " + keys[1] + " caracteres<br/>";
                                    okay = false;
                                }
                            }

                            if (keys[0].equals("max")) {
                                if (current_value.length() > Integer.parseInt(keys[1])) {
                                    error += "Le champ " + Lang.get(field.getKey()) + " doit faire au plus " + keys[1] + " caracteres<br/>";
                                    okay = false;
                                }
                            }

                            if (keys[0].equals("len")) {
                                if (current_value.length() != Integer.parseInt(keys[1])) {
                                    error += "Le champ " + Lang.get(field.getKey()) + " doit faire " + keys[1] + " caracteres de long<br/>";
                                    okay = false;
                                }
                            }
                        }
                    }
                }

                //"unique[table.column]"
                if (singleRule.contains("unique")) {
                    if (!error.contains(Lang.get(field.getKey()))) {
                        singleRule = singleRule.replace("unique[", "").replace("]", "").replace(".", " ");
                        String[] keys = singleRule.split(" ");
                        if (new D_Auth().isNotUnique(keys[0], keys[1], current_value, FormvalidationWithImage.data.get("ID"))) {
                            error += "Le champ " + Lang.get(field.getKey()) + " doit etre unique<br/>";
                            okay = false;
                        }
                    }
                }

                //only-digit
                if (singleRule.equals("only-digit")) {
                    for (int i = 0; i < current_value.length(); i++) {
                        if (Character.isLetter(current_value.charAt(i))) {
                            error += "Le champ " + Lang.get(field.getKey()) + " ne doit contenir que des chiffres<br/>";
                            break;
                        }
                    }
                }

                //only-letter
                if (singleRule.equals("only-letter")) {
                    for (int i = 0; i < current_value.length(); i++) {
                        if (Character.isDigit(current_value.charAt(i))) {
                            error += "Le champ " + Lang.get(field.getKey()) + " ne doit contenir que des lettres<br/>";
                            break;
                        }
                    }
                }
            }
        }
        return okay;
    }

    private static void clearError() {
        FormvalidationWithImage.error = "";
    }

    public static String error() {
        return FormvalidationWithImage.error;
    }
}
