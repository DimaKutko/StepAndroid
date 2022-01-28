package com.example.classwork2801;

import android.app.Dialog;
import android.os.Bundle;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.DialogFragment;

public class AlexDialog extends DialogFragment {

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {

        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle("Очень важное сообщение!")
                .setIcon(R.drawable.enot)
                .setMessage("Срочно покормите енота!")
                .setPositiveButton("Будет сделано!", (dialog, id) -> Toast.makeText(getActivity().getApplicationContext(),
                        "кормим енота вкусняшками", Toast.LENGTH_SHORT).show())
                .setNegativeButton("Он не голодный!", (dialog, id) -> Toast.makeText(getActivity().getApplicationContext(),
                        "отмена работы с диалогом", Toast.LENGTH_SHORT).show());

        return builder.create();
    }
}