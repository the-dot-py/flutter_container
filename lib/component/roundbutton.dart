import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color,textColor;
  final bool loading;
  const RoundButton({Key? key,
    required this.title,
    required this.onPress,
    this.color=Colors.blue,
    this.textColor=Colors.white,
    required this.loading,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading?null:onPress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child:loading? Center(child: CircularProgressIndicator(color: Colors.white,))
            :Center(child: Text(title,style: Theme.of(context).textTheme.headlineSmall,)),
      ),
    );
  }
}
