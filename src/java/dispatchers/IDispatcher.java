/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dispatchers;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author BR
 */
public interface IDispatcher 
{   
//    public String execute(HttpServletRequest request, String datasource);
    public String execute(HttpServletRequest request);
}
