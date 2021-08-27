/*
 *  Copyright 2009 root.
 * 
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *       http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *  under the License.
 */
package pt.uc.dei.wsvdbench.tpcw.versions;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author root
 */
public class TPCWUtil {

    /***
     *
     * // Defined in TPC-W Spec Clause 4.6.2.8
     */
    private static final String[] digS = {
        "BA", "OG", "AL", "RI", "RE", "SE", "AT", "UL", "IN", "NG"
    };
    public final static SimpleDateFormat ORACLE_DATE_FORMATTER = new SimpleDateFormat("'to_date('''dd-MM-yyyy''', ''dd-mm-yyyy'')'");

    public static String DigSyl(int d, int n) {
        String s = "";
        if (n == 0) {
            return (DigSyl(d));
        }
        for (; n > 0; n--) {
            int c = d % 10;
            s = digS[c] + s;
            d = d / 10;
        }
        return (s);
    }

    private static String DigSyl(int d) {
        String s = "";
        for (; d != 0; d = d / 10) {
            int c = d % 10;
            s = digS[c] + s;
        }
        return (s);
    }

    public static String formatDate(Date d) {
        return ORACLE_DATE_FORMATTER.format(d);
    }
    /**
     * TPCW_Util
     */
    private static final int NUM_ITEMS = 10000;
    private static Random rand = new Random();

    public static int getRandomI_ID() {
        Double temp = new Double(Math.floor(rand.nextFloat() * NUM_ITEMS));
        return temp.intValue();
    }
}
