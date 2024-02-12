import 'package:flutter/material.dart';
import 'package:my_table_calendar/const/colors.dart';

class CusTomTextField extends StatelessWidget {
  const CusTomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' 시작 시간', style: TextStyle(color: PRIMARY_COLOR)),
                      TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' 종료 시간', style: TextStyle(color: PRIMARY_COLOR)),
                      TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(' 내용', style: TextStyle(color: PRIMARY_COLOR)),
                  Expanded(
                    child: TextFormField(
                      // note: 내용 길면 이렇게 설정한다
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: LIGHT_GREY_COLOR,
                      backgroundColor: PRIMARY_COLOR,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                    ),
                    onPressed: () {
                      // todo: 로컬에 저장하기 위한 설정하기
                    },
                    child: Text('저장'),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: LIGHT_GREY_COLOR,
                      backgroundColor: PRIMARY_COLOR,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
