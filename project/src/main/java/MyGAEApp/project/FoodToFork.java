//package MyGAEApp.project;
//
//import java.io.BufferedReader;
//import java.io.FileNotFoundException;
//import java.io.FileReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.URL;
//import java.net.URLConnection;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Scanner;
//import java.util.Set;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//import javax.servlet.http.HttpServletResponse;
//import com.google.appengine.api.datastore.DatastoreService;
//import com.google.appengine.api.datastore.DatastoreServiceFactory;
//import com.google.appengine.api.datastore.Entity;
//import com.google.appengine.api.datastore.Key;
//import com.google.appengine.api.datastore.KeyFactory;
//import com.google.appengine.api.datastore.PreparedQuery;
//import com.google.appengine.api.datastore.Query;
//import com.google.appengine.api.users.User;
//import com.google.appengine.api.users.UserService;
//import com.google.appengine.api.users.UserServiceFactory;
//import com.google.common.reflect.TypeToken;
//import com.google.gson.Gson;
//
//
//public class FoodToFork {
//	static String swap(String url) {
//		//Swap whitespace with "%20" so that the URL works
//		String[] array = url.split("");
//		String returnString = "";
//		for (int i = 0; i < array.length; i++) {
//		if (array[i].equals(" ")) {
//		array[i] = "%20";
//		}
//		returnString += array[i];
//		}
//		return returnString;
//		}
//
//}
