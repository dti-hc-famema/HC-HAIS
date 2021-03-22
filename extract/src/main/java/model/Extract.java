package model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Extract {

    private List<String> extractText = new ArrayList<>();
    private int extractionGroupQuantity;
    private List<String> extraData = new ArrayList<>();

    public Extract() {
        this.extractionGroupQuantity = 0;
    }

    public Extract(List<String> extractText, int extractionGroupQuantity, List<String> extraData) {
        this.extractText.addAll(extractText);
        this.extractionGroupQuantity = extractionGroupQuantity;
        this.extraData.addAll(extraData);
    }

    public List<String> getExtractText() {
        return extractText;
    }

    public void setExtractText(List<String> extractText) {
        this.extractText.clear();
        this.extractText.addAll(extractText);
    }

    public int getExtractionGroupQuantity() {
        return extractionGroupQuantity;
    }

    public void setExtractionGroupQuantity(int extractionGroupQuantity) {
        this.extractionGroupQuantity = extractionGroupQuantity;
    }

    public List<String> getExtraData() {
        return extraData;
    }

    public void setExtraData(List<String> extraData) {
        this.extraData.clear();
        this.extraData.addAll(extraData);
    }
}
