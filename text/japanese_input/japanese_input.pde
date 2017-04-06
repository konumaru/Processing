import java.awt.*;
import javax.swing.*;

void setup(){
JPanel panel = new JPanel();
BoxLayout layout = new BoxLayout(panel, BoxLayout.Y_AXIS);
panel.setLayout(layout);

panel.add(new JLabel("入力"));
JTextField text1 = new JTextField();
panel.add(text1);

int r = JOptionPane.showConfirmDialog(
null,   // オーナーウィンドウ
panel,   // メッセージ
"日本語入力",   // ウィンドウタイトル
JOptionPane.OK_CANCEL_OPTION,  // オプション（ボタンの種類）
JOptionPane.QUESTION_MESSAGE);  // メッセージタイプ（アイコンの種類）

println(r);
println(text1.getText());

}
