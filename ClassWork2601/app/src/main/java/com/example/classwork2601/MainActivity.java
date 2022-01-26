package com.example.classwork2601;

import android.os.Bundle;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.HashMap;

//class MyArrayAdapter extends ArrayAdapter<String> {
//
//    private final Context context;
//    private final String[] descriptions;
//    private final String[] urls;
//
//    public MyArrayAdapter(Context context, String[] descriptions, String[] urls) {
//        super(context, R.layout.my_item, descriptions);
//        this.context = context;
//        this.descriptions = descriptions;
//        this.urls = urls;
//    }
//
//    // getView - запускается андроидом автоматически в момент генерации очередного пукта списка
//    // если пунктов 4 - то этот метод сработает 4 раза, с position"ами 0 1 2 3
//    @Override
//    public View getView(int position, View convertView, ViewGroup parent) {
//
//        // LayoutInflater - специальная фоновая служба ОС Android, которая позволяет сгенерить Java-объекты на основании XML-вёрстки
//        LayoutInflater inflater = (LayoutInflater) context
//                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
//
//        // rowView - это будет ссылка на корневой лэяут (в данном случае это LinearLayout из файла item.xml
//        View rowView = inflater.inflate(R.layout.my_item, parent, false);
//        TextView textView = rowView.findViewById(R.id.label);
//        ImageView imageView = rowView.findViewById(R.id.logo);
//
//        // момент прогрузки данных в пункты списка:
//        textView.setText(descriptions[position]);
//
//        // https://github.com/bumptech/glide
//        Glide.with(context).load(urls[position]).into(imageView);
//
//        return rowView;
//    }
//}

public class MainActivity extends AppCompatActivity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ListView people = findViewById(R.id.list);

        ArrayList<HashMap<String, String>> al = new ArrayList<>();
        HashMap<String, String> map;

        map = new HashMap<>();
        map.put("name", "Александр Иванов");
        map.put("phone", "+38 063 03 000 35");
        al.add(map);

        map = new HashMap<>();
        map.put("name", "Борис Петров");
        map.put("phone", "+38 050 050 00 50");
        al.add(map);

        map = new HashMap<>();
        map.put("name", "Вероника Мельник");
        map.put("phone", "+38 067 67 11 777");
        al.add(map);

        SimpleAdapter adapter = new SimpleAdapter(
                this,
                al,
                android.R.layout.simple_list_item_2,
                new String[]{"name", "phone"},
                new int[]{android.R.id.text1, android.R.id.text2
        });

        people.setAdapter(adapter);

    }
}
