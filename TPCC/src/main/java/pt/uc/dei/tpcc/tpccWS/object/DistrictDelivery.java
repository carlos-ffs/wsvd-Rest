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

import java.io.Serializable;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author nmsa@dei.uc.pt
 */
@XmlType(name = "DistrictDelivery", namespace = "http://tpcc.wsvdbench.dei.uc.pt/")
public class DistrictDelivery implements Serializable {

    public int district;
    public long orderid;

    public DistrictDelivery() {
    }

    public DistrictDelivery(int district, long orderid) {
        this.district = district;
        this.orderid = orderid;
    }

    /**
     * @return the district
     */
    public int getDistrict() {
        return district;
    }

    /**
     * @param district the district to set
     */
    public void setDistrict(int district) {
        this.district = district;
    }

    /**
     * @return the orderi
     */
    public long getOrderid() {
        return orderid;
    }

    /**
     * @param orderid the orderi to set
     */
    public void setOrderid(long orderid) {
        this.orderid = orderid;
    }
}
