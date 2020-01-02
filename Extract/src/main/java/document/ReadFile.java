package document;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.lang.reflect.Type;
import java.util.List;
import model.Extract;

public class ReadFile {

    public static List<Extract> getExtract (String pathToFile) throws FileNotFoundException {
        BufferedReader bufferedReader = new BufferedReader(new FileReader(pathToFile));
        Gson readJson = new Gson();
        Type type = new TypeToken<List<Extract>>() {}.getType();
        return readJson.fromJson(bufferedReader, type);
    }

}
