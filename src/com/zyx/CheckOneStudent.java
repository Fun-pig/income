package com.zyx.main;

import java.util.Random;

/**
 * Created by Ethel_oo on 2019/9/5.
 */
public class CheckOneStudent {
    public static void main(String[] args) {
        String[] students = {
//                网工171
                "李博文", "殷绣", "储柱红", "代成路", "单宇新",
                "樊星宇", "方震", "冯源", "高畅", "宫雪",
                "胡伟宇", "靳燕涛", "康鸿运", "杨佳伟", "李抗",
                "刘韬", "刘毅杰", "万爽", "汪红光", "汪鑫",
                "吴强珉", "吴文廷", "杨凌烨", "姚磊", "程家乐",
                "于金可", "喻超", "张浩", "周圣恩", "程磊",
                "夏凌", "张航",

//                网工172
                "朱豪", "强梦凡", "房杰", "高天赐", "龚菲菲",
                "胡晓婷", "李皖秋", "梁敏敏", "刘琼", "刘斯博",
                "卢宁波", "马陈坤", "牛得草", "潘科朗", "施权",
                "潘克旭", "齐文静", "陈伟强", "乔明磊", "申帅",
                "王郭靖", "吴文杰", "张海军", "张建国", "赵宇航",
                "周新杰", "蔡雨晴", "朱骏华", "邹浩宇", "徐子寒",
//               "刘照伟",当兵去了

//                网工173
                "卢翔", "赵启", "程俊杰-2", "程吴琪", "胡家榜",
                "胡协栋", "吉玉程", "李长旗", "李佳妮", "李康",
                "李伟", "李逸凡", "刘园园", "曹武", "卢新宇",
                "戚子杨", "桑章要", "孙倩文", "王于刚", "魏俊华",
                "习浴光", "徐凡", "张超军", "张浩", "章岚",
                "陈倩阁", "杨汝璇"
        };
//        方法一：使用Random().nextInt(n);
//        int index = new Random().nextInt(students.length);
//        System.out.println("同学一：" + students[index]);

//        方法二：使用Math.random()
//        int max = students.length - 1;
//        int min = 0;
//        int index2 = (int) (Math.random() * (max - min + 1) + min);
//        System.out.println("同学二：" + students[index2]);

        for(int i = 0; i < 10; i++) {
            int index = new Random().nextInt(students.length);
            System.out.println("同学：" + students[index]);
        }
    }
}
