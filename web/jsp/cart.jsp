<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>Shopping Cart</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    </head>

    <%@ page import="model.*" %>
    <%@ page import="java.util.*"%>
    <%@ page import="java.text.*"%>
    
    <div>
        <jsp:include page="header.jsp" />  
    </div>
    
    <body bgcolor="#FFFFFF" text="#000000">
        <h2 align="center"><b>The followings Items are in your shopping cart </b></h2>
        <form name="form1" method="post" action="./books">
            <input type="hidden" name="action" value="update_cart">
            <table width="100%" border="1" cellspacing="0" cellpadding="3" height="98">
                <tr> 
                    <td width="13%" bgcolor="#CCCCCC"> 
                        <div align="center"><font face="Arial, Helvetica, sans-serif" size="3">ISBN</font></div>
                    </td>
                    <td width="34%" bgcolor="#CCCCCC"> 
                        <div align="center"><font face="Arial, Helvetica, sans-serif" size="3">Title</font></div>
                    </td>
                    <td width="13%" bgcolor="#CCCCCC"> 
                        <div align="center"><font face="Arial, Helvetica, sans-serif" size="3">Price/unit</font></div>
                    </td>
                    <td width="9%" bgcolor="#CCCCCC"> 
                        <div align="center"><font face="Arial, Helvetica, sans-serif" size="3">Quantity</font></div>
                    </td>
                    <td width="20%" bgcolor="#CCCCCC"> 
                        <div align="center"><font face="Arial, Helvetica, sans-serif" size="3">Subtotal</font></div>
                    </td>
                    <td width="11%" bgcolor="#CCCCCC"> 
                        <div align="center"><font face="Arial, Helvetica, sans-serif" size="3">Remove</font></div>
                    </td>
                </tr>

                <c:set var="s_cart" value="${sessionScope.cart}"/>
                <c:choose>
                    <c:when test='${not empty s_cart}'>
                        <c:forEach var="item" items="${s_cart}">
                            <c:set var="cartItem" value='${item.value}'/>
                            <c:set var="cost" value='${cartItem.getOrderCost()}'/>
                            <c:set var="totalCostOfOrder" value='${totalCostOfOrder + cost}'/>
                            <tr> 
                                <td height="13" bgcolor="#E8FFE8"><c:out value='${cartItem.getBook().getIsbn()}'/></td>
                                <td height="13" bgcolor="#E8FFE8"><c:out value='${cartItem.getBook().title}'/></td>
                                <td height="13" bgcolor="#E8FFE8"><c:out value='${cartItem.getBook().getDollarPrice()}'/></td>
                                <td width="9%" height="5"> 
                                    <input type="text" name='${cartItem.getBook().getIsbn()}' size="2" value='${cartItem.getQuantity()}' maxlength="4">
                                </td>

                                <td height="13" bgcolor="#E8FFE8"><c:out value='${cartItem.getDollarOrderCost()}'/></td>
                                <td width="11%" height="5"> 
                                    <div align="center"> 
                                        <input type="checkbox" name="remove" value='${cartItem.getBook().getIsbn()}'>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr bgcolor="#E4E4E4"> 
                            <td width="13%" height="2" bordercolor="#CCCCCC"> 
                                <input type="submit" name="Submit" value="Update Cart">
                            </td>
                            <td width="34%" height="2" bordercolor="#CCCCCC">&nbsp; </td>
                            <td width="13%" height="2" bordercolor="#CCCCCC">&nbsp; </td>
                            <td width="9%" height="2" bordercolor="#CCCCCC">&nbsp; </td>
                            <td width="20%" height="2" bordercolor="#CCCCCC"> 
                                <div align="right"><font face="Times New Roman, Times, serif"><b>
                                        <font size="2" face="Arial, Helvetica, sans-serif">
                                        <fmt:setLocale value="en_US"/>
                                        Order Total: <fmt:formatNumber value="${totalCostOfOrder}" type="currency"/>
                                        </font></b></font></div>
                            </td>
                            <td width="11%" height="2" bordercolor="#CCCCCC">&nbsp;</td>
                        </tr>



                    </c:when>
                    <c:otherwise>
                        <tr> 
                            <td height="13">No Items in Cart</td>
                        </tr>
                    </c:otherwise>
                </c:choose>

            </table>
        </form>
        <p><a href="./books?action=continue">Continue Shopping</a></p>
        <p><a href="./books?action=checkout">Check Out</a></p>
        
        <div>
            <jsp:include page="footer.jsp" />
        </div>
    </body>
</html>
