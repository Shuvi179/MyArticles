package myArticles.edu.controllers.common;

import myArticles.edu.controllers.ControllerUrls;
import myArticles.edu.controllers.Security;
import myArticles.edu.controllers.ViewUrls;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/articlescount")
public class ArticleCount extends HttpServlet {
    private static final long serialVersionUID = 11L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!(request.isRequestedSessionIdValid() && request.isRequestedSessionIdFromCookie())) {
            Security.endSession(response);
            getServletConfig()
                    .getServletContext()
                    .getRequestDispatcher(ViewUrls.LOGIN_JSP.toString())
                    .forward(request, response);
        } else {

            getServletConfig()
                    .getServletContext()
                    .getRequestDispatcher(ControllerUrls.USER_ARTICLES_SERVLET.toString())
                    .forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
