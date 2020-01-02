package document;

import com.google.gson.Gson;
import model.Extract;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import model.Export;

public class CreateFile {

    public static void createFile(String path, List<?> extractList) throws IOException {
        Gson gson = new Gson();
        String json = gson.toJson(extractList);
        FileOutputStream fileOutputStream = new FileOutputStream(path);
        fileOutputStream.write(json.getBytes());
        fileOutputStream.flush();
        fileOutputStream.close();
    }

}
