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
package pt.uc.dei.tpcc.tpccWS.object;

import com.google.gson.Gson;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author nmsa@dei.uc.pt
 */
public class ShortOrder implements Serializable {

    public long o_id;
    public double total_amount;

    public ShortOrder() {
    }

    public ShortOrder(long o_id, double total_amount) {
        this.o_id = o_id;
        this.total_amount = total_amount;
    }


    public long getO_id() {
        return o_id;
    }

    /**
     * @param o_id the o_id to set
     */
    public void setO_id(long o_id) {
        this.o_id = o_id;
    }

    /**
     * @return the total_amount
     */
    public double getTotal_amount() {
        return total_amount;
    }

    /**
     * @param total_amount the total_amount to set
     */
    public void setTotal_amount(long total_amount) {
        this.total_amount = total_amount;
    }

    public String getShortOrderInJson(){
        return new Gson().toJson(this);
    }
}
