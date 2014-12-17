package MyGAEApp.project;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;

public class RecipeServlet extends HttpServlet{
     
	private class F2Response{
    	 public ArrayList<Recipe> recipies;
    	 public F2Response() {}
    	 
    	 public void setRecipies(ArrayList<Recipe> res){
    		 this.recipies = res;
    	 }
     }
     
     public class Recipe implements Serializable{
         /**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		public String publisher;
         public String f2f_url;
         public String title;
         public String source_url;
         public String recipe_id;
         public String image_url;
         public String social_rank;
         public String publisher_url;
        
         public Recipe(){
                
         }
         public String toString(){
             return this.title;
         }
     }
     
     public void doPost(HttpServletRequest req, HttpServletResponse resp)
		      throws IOException, ServletException {
    	 String urlstr = req.getParameter("search");
    	 Gson gson = new Gson();
         String json;
		try {
			json = getJsonFromAPI(urlstr); //this works
			F2Response response = gson.fromJson(json, new TypeToken<F2Response>(){}.getType()); //something goes wrong here
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		if (json!=null){
//			RecipeServlet response = gson.fromJson(json, RecipeServlet.class);
//	        System.out.println(response.recipies);
//		}
         
     }
     
     public static String getJsonFromAPI(String urlstr) throws Exception{
         BufferedReader reader = null;
         try {
        	 URL url = new URL("http://food2fork.com/api/search?key=02494a85beaa104a5de8ab8546d094cb&q="+urlstr);
        	 reader = new BufferedReader(new InputStreamReader(url.openStream()));
        	 StringBuffer buffer = new StringBuffer();
        	 int read;

        	 char[] chars = new char[1024];
        	 while ((read = reader.read(chars)) != -1)
        		 buffer.append(chars, 0, read);
        	 return buffer.toString();
         	}
         finally {
        	 if (reader != null) reader.close();
         }
     }
     
}


