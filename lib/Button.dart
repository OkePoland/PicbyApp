import 'package:flutter/material.dart';
import 'package:picby/utils/assets.dart';

class Button extends StatelessWidget {
  final onPressed;
  final String title;
  final int id;

  const Button({Key key, this.onPressed, this.title, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (id == 2) {
      return FlatButton(onPressed: onPressed, child: Text(title), textColor: Color(0xFF3180AE),);
    }
    return RaisedButton(
      padding: const EdgeInsets.all(0.0),
      textColor: id == 1 || id == 2 ? Color(0xFF3180AE) : Colors.white,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.75,
        height: 36,
        decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2.0,
                      offset: Offset(0.0, 2.0),
                      color: Color.fromRGBO(0, 0, 0, 0.24)),
                  BoxShadow(
                      blurRadius: 2.0,
                      offset: Offset(0.0, 0.0),
                      color: Color.fromRGBO(0, 0, 0, 0.12))
                ],
                gradient: id == 1
                    ? null
                    : LinearGradient(
                        colors: [Color(0xFF3180AE), Color(0xFF074782)],
                        stops: [-0.13, 0.7],
                      ),
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    width: 2.0,
                    style: BorderStyle.solid,
                    color: Color.fromRGBO(49, 128, 174, 0.1)),
                color: id == 1 ? Color.fromRGBO(255, 255, 255, 0.87) : null,
              ),
        child: id == 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Assets.logoGoogle,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Text(
                title,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
