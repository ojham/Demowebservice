package Utils;

import Base.baseUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

//import static org.jsoup.nodes.Entities.EscapeMode.base;

public class genericUtils extends baseUtil {
    private baseUtil base;

    /**
     * Reading Property File
     */
    public Properties readPropertyFile(String filePath) {
        File file = new File(filePath);
        Properties prop = new Properties();
        try {
            FileInputStream fileInput = new FileInputStream(file);
            //load properties file
            prop.load(fileInput);
        } catch (Exception e) {
            System.out.println("Exception has Occurred in Method readPropertyFile" + e.getMessage() + e.getStackTrace());

        }
        return prop;
    }

    public String fetchTimeStamp() {
        String dateAndTime = null;
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
            Date date = new Date();
            dateAndTime = dateFormat.format(date);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return dateAndTime;
    }




}
