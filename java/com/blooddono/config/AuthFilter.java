package com.blooddono.config;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        
        // Get session but don't create if it doesn't exist
        HttpSession session = req.getSession(false);
        
        // Debug info - print URI and session status
        System.out.println("DEBUG: Request URI = " + uri);
        System.out.println("DEBUG: User session exists = " + (session != null));
        if (session != null) {
            System.out.println("DEBUG: User attribute = " + session.getAttribute("user"));
        }
        
        // Check if user is logged in (explicitly check for null to avoid NPE)
        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        System.out.println("DEBUG: User is logged in = " + loggedIn);
        
        // Define publicly accessible pages
        boolean isPublicPage = uri.equals(contextPath + "/home") ||
                              uri.equals(contextPath + "/register") ||
                              uri.equals(contextPath + "/login") ||
                              uri.equals(contextPath + "/about") ||
                              uri.equals(contextPath + "/") ||
                              uri.equals(contextPath);
        
        // Define protected pages
        boolean isProtectedPage = uri.equals(contextPath + "/campaign") ||
                                uri.equals(contextPath + "/blog") ||
                                uri.equals(contextPath + "/contact") ||
                                uri.equals(contextPath + "/request-blood");
        
        // Allow static resources
        boolean isStaticResource = uri.contains("/css/") || 
                                  uri.contains("/js/") || 
                                  uri.contains("/images/") || 
                                  uri.endsWith(".css") || 
                                  uri.endsWith(".js") || 
                                  uri.endsWith(".png") || 
                                  uri.endsWith(".jpg") || 
                                  uri.endsWith(".jpeg") || 
                                  uri.endsWith(".gif") ||
                                  uri.endsWith(".ico");
        
        System.out.println("DEBUG: Public page = " + isPublicPage);
        System.out.println("DEBUG: Protected page = " + isProtectedPage);
        System.out.println("DEBUG: Static resource = " + isStaticResource);
        System.out.println("DEBUG: Session ID = " + (session != null ? session.getId() : "no session"));

        
        // Process the request
        if (isPublicPage || isStaticResource) {
            // Allow public pages and static resources without any checks
            System.out.println("DEBUG: Allowing public page or static resource");
            chain.doFilter(request, response);
        }
        else if (isProtectedPage) {
            if (loggedIn) {
                // User is logged in and accessing protected page - allow
                System.out.println("DEBUG: User logged in, allowing protected page");
                chain.doFilter(request, response);
            } else {
                // User is not logged in but trying to access protected page
                System.out.println("DEBUG: User not logged in, redirecting to login");
                HttpSession newSession = req.getSession(true);
                newSession.setAttribute("redirectAfterLogin", uri);
                res.sendRedirect(contextPath + "/login");
            }
        }
        else {
            // For any unexpected paths, just continue the chain
            System.out.println("DEBUG: Unhandled path, continuing filter chain");
            chain.doFilter(request, response);
        }
    }
    
    
}