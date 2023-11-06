import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class YanMenu extends StatefulWidget {
  @override
  State<YanMenu> createState() => _YanMenuState();
}

class _YanMenuState extends State<YanMenu> {
  String _currentDateTime = '';

  @override
  void initState() {
    super.initState();
    // Widget oluşturulduğunda, zamanı güncelleyen bir işlem başlatılır.
    updateDateTime();
  }

  void updateDateTime() {
    setState(() {
      _currentDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    });

    // Her saniye tekrar güncelleme yapar.
    Future.delayed(Duration(seconds: 1), updateDateTime);
  }

  //const YanMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.0),
      child: Drawer( //Sürüklenebilir menü
        backgroundColor: Color.fromARGB(255, 29, 29,29),
      child:Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 20),
                child: Text(  '$_currentDateTime',
                  style: TextStyle(fontSize: 17,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 70),
                child: IconButton(
                  onPressed: (){
                    showModalBottomSheet(
                        backgroundColor: Colors.black,
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20)
                          ),

                        ),
                        builder: (context)=>Container(child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.image,color: Colors.amber,),
                              title: Text('Logomu Değiştir',style: TextStyle(color: Colors.white),),
                            ),
                            ListTile(
                                leading: Icon(Icons.update,color: Colors.green,),
                                title: Text('Tüm Verileri Güncelle',style: TextStyle(color: Colors.white,),)
                            ),
                            ListTile(
                              leading: Icon(Icons.exit_to_app,color: Colors.red,),
                              title: Text('Çıkış Yap',style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        ),
                        ));
                  },
                  icon: Icon(Icons.more_vert,color: Colors.white,),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Image.asset('images/dk1.png'),
          ),
          Row(
            children: [
                Padding(padding: EdgeInsets.only(top: 20,left: 70),
                child: Text('HER ZAMAN SİZİNLE...',style: TextStyle(color: Colors.white,fontSize:15.0 ),),
                ),


            ],
          ),
          Expanded(child: ListView(
            children: [
            ExpansionTile(// leading-title-trealing
                leading: Icon(Icons.group,color: Colors.white,),
                title: Text('Cari İşlemler',style:TextStyle(color: Colors.white,fontSize: 15.0) ,),
                trailing: Icon(Icons.expand_more,color: Colors.white,),
              children: [
                 Container(
                   margin: EdgeInsets.only(left: 10.0),
                   child: ListTile(
                     leading: Icon(Icons.list,color: Colors.white,),
                     title: Text('Cari Kart Listesi',style: TextStyle(color: Colors.white),),
                     onTap: (){},
                   ),
                 ),
               ],
                //trailing: Icon(Icons.expand_more,color: Colors.white,),
               // onTap: (){  Navigator.pop(context); },
              ),
              Divider(
                height: 15.0,
                color:  Colors.black,
              ),

              ExpansionTile(
                  leading: Icon(Icons.receipt,color: Colors.white,),
                  title: Text('Fatura İşlemleri',style:TextStyle(color: Colors.white,fontSize: 15.0) ,),
                  trailing: Icon(Icons.expand_more,color: Colors.white,),
                children:[
                  Container(
                    child: Padding(padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.shopping_bag,color: Colors.white,),
                      title: Text('Satış Fatura Kayıt',style: TextStyle(color: Colors.white),),
                    ),),
                  ),
                  Container(
                    child: Padding(padding: EdgeInsets.only(left: 10.0),
                      child: ListTile(
                        leading: Icon(Icons.receipt_long,color: Colors.white,),
                        title: Text('Alış İrsaliye Kayıt',style: TextStyle(color: Colors.white),),
                      ),),
                  ),
                ]

              ),


              ExpansionTile(
                  title: Text('Stok İşlemleri',style: TextStyle(color: Colors.white),),
                  leading:Icon( Icons.category,color: Colors.white,),
                  trailing: Icon(Icons.expand_more,color: Colors.white,),
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.app_registration,color: Colors.white,),
                      title: Text('Stok Kart Listesi',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.local_shipping,color: Colors.white,),
                      title: Text('Depo Transfer',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.content_paste_search,color: Colors.white,),
                      title: Text('Sayım Kayıt Fişi',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                ],
              ),

              ExpansionTile(
                title:  Text('Tahsilat ve Ödeme İşlemleri',style:TextStyle(color: Colors.white,fontSize: 15.0) ,),
                leading: Icon(Icons.credit_card,color: Colors.white,),
                trailing: Icon(Icons.expand_more,color: Colors.white,),
               children: [
                 Container(
                   padding: EdgeInsets.only(left: 10.0),
                   child: ListTile(// leading-title-trealing
                     leading: Icon(Icons.add_card,color: Colors.white,),
                     title: Text('Tahsilat',style: TextStyle(color: Colors.white),),
                     onTap: (){  Navigator.pop(context); },
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.only(left: 10.0),
                   child: ListTile(// leading-title-trealing
                     leading: Icon(Icons.account_balance_wallet,color: Colors.white,),
                     title: Text('Ödeme',style: TextStyle(color: Colors.white),),
                     onTap: (){  Navigator.pop(context); },
                   ),
                 ),
               ],
              ),
              Divider(
                height: 15.0,
                color:  Colors.black,
              ),

              ExpansionTile(
                  leading: Icon(Icons.insert_chart,color: Colors.white,),
                  title:Text('Raporlar',style:TextStyle(color: Colors.white,fontSize: 15.0) ,),
                  trailing: Icon(Icons.expand_more,color: Colors.white,),
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.badge,color: Colors.white,),
                      title: Text('Cari Raporları',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.query_stats,color: Colors.white,),
                      title: Text('Stok Raporları',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.bar_chart,color: Colors.white,),
                      title: Text('Fatura Raporları',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.cloud_upload,color: Colors.white,),
                      title: Text('Gönderilmiş Faturalar',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.cloud_upload,color: Colors.white,),
                      title: Text('Gönderilmiş Tahsilat & Ödemeler',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.cloud_upload,color: Colors.white,),
                      title: Text('Gönderilmiş Sayımlar',style: TextStyle(color: Colors.white),),
                      onTap: (){  Navigator.pop(context); },
                    ),
                  ),

                ],
              ),



            ],
          ))
        ],
      ),
      ),
    );
  }
}
