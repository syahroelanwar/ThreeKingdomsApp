import 'package:flutter/material.dart';

class History extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Color(0xffeeeeee),
            blurRadius: 1.0,
            offset: new Offset(1.0, 1.0),
          ),
        ]),
        child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:10.0, top:10.0),
                    child: Text("Three Kingdoms History", style: TextStyle(
                        color:Colors.black87, fontWeight: FontWeight.bold,
                        fontSize:20.0
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0, top:3.0),
                    child: Text("From Wikipedia, the free encyclopedia", style: TextStyle(
                        color:Color(0xff616161),
                        fontSize:12.0
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0, top:10.0, right: 10.0),
                    child: Image(
                      image: AssetImage("assets/images/rtk.gif"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0, top:10.0, right: 10.0, bottom: 10),
                    child: Text(
                      "The Three Kingdoms (simplified Chinese: 三国时代; traditional Chinese: 三國時代; pinyin: Sānguó Shídài) from 220–280 AD was the tripartite division of China among the states of Wei, Shu, and Wu.[1] The Three Kingdoms period started with the end of the Han dynasty and was followed by the Jin dynasty. The short-lived Yan kingdom in the Liaodong Peninsula, which lasted from 237 to 238, is sometimes considered as a '4th kingdom'.[2]To distinguish the three states from other historical Chinese states of the same names, historians have added a relevant character to the state's original name: the state that called itself Wei (魏) is also known as Cao Wei (曹魏),[3][4] the state that called itself Han (漢) is also known as Shu Han (蜀漢) or just Shu (蜀), and the state that called itself Wu (吳) is also known as Eastern Wu (東吳; Dōng Wú) or Sun Wu (孫吳).Academically, the period of the Three Kingdoms refers to the period between the foundation of the state of Wei in 220 AD and the conquest of the state of Wu by the Jin dynasty in 280. The earlier, unofficialsemanticsLabel: part of the period, from 184 to 220, was marked by chaotic infighting between warlords (军阀) in various parts of China. The middle part of the period, from 220 to 263, was marked by a more militarily stable arrangement between three rival states of Wei, Shu, and Wu. The later part of the era was marked by the conquest of Shu by Wei (263), the usurpation of Wei by the Jin dynasty (265), and the conquest of Wu by the Jin (280).The Three Kingdoms period is one of the bloodiest in Chinese history.[5] A nationwide census taken in 280 AD, following the reunification of the Three Kingdoms under the Jin shows a total of 2,459,840 households and 16,163,863 individuals which was only a fraction of the 10,677,960 households, and 56,486,856 individuals reported during the Han era.[6] While the census may not have been particularly accurate due to a multitude of factors of the times, In 280, the Jin did make an attempt to account for all individuals where they could.[7]Technology advanced significantly during this period. Shu chancellor Zhuge Liang invented the wooden ox,[8] suggested to be an early form of the wheelbarrow,[9] and improved on the repeating crossbow.[10] Wei mechanical engineer Ma Jun is considered by many to be the equal of his predecessor Zhang Heng.[11] He invented a hydraulic-powered, mechanical puppet theatre designed for Emperor Ming of Wei, square-pallet chain pumps for irrigation of gardens in Luoyang, and the ingenious design of the south-pointing chariot, a non-magnetic directional compass operated by differential gears.[12]Although relatively short, this historical period has been greatly romanticized in the cultures of China, Japan, Korea, and Vietnam.[13] It has been celebrated and popularized in operas, folk stories, novels and in more recent times, films, television, and video games. The best known of these is Luo Guanzhong's Romance of the Three Kingdoms, a Ming dynasty historical novel based on events in the Three Kingdoms period.[14] The authoritative historical record of the era is Chen Shou's Records of the Three Kingdoms, along with Pei Songzhi's later annotations of the text.The English-language term 'Three Kingdoms' is something of a misnomer, since each state was eventually headed not by a king, but by an emperor who claimed suzerainty over all China.[15] Nevertheless, the term 'Three Kingdoms' has become standard among English-speaking sinologists."
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0, right: 10.0, bottom: 10),
                    child: Text("Sources : \n"
                        "https://koei.fandom.com/\n"
                        "https://threekingdoms.wikia.org/\n"
                        "https://the3kingdoms.fandom.com/wiki/\n"
                        "http://kongming.net/\n"
                        "https://military.wikia.org/wiki/", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blue),),
                  )
                ],
              )
        ),
      ),
    );
  }
}
