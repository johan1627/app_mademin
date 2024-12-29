import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class CompWelTenantCard extends StatelessWidget {
  const CompWelTenantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: greyColor),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buat aplikasi trial 7 hari",
            style: h4.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12.0),
          // const CompReferralListTile(
          //   title: "Apps Kasir Digital",
          //   subtitle: "Akses online, kapanpun dan dimanapun.",
          //   icon: Icons.app_registration_outlined,
          // ),
          // const CompReferralListTile(
          //   title: "Pembayaran Digital Melalui QRIS",
          //   subtitle: "QR Code Standar Pembayaran Nasional.",
          //   icon: Icons.qr_code_scanner,
          // ),
          // const CompReferralListTile(
          //   title: "Dashboard Laporan Realtime",
          //   subtitle: "Laporan transaksi secara online dan realtime.",
          //   icon: Icons.analytics_outlined,
          // ),
          // const CompReferralListTile(
          //   title: "Manajemen Stok Persediaan",
          //   subtitle: "Kelola stok persediaan bahan baku.",
          //   icon: Icons.inventory_2_outlined,
          // ),
          // const CompReferralListTile(
          //   title: "Manajemen Resep, Dapur",
          //   subtitle: "Kelola flow kerja staff outlet.",
          //   icon: Icons.soup_kitchen_outlined,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ButtonWide(
              lable: "Mulai Buat Trial",
              type: "primary",
              onSaved: () {
                //
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (BuildContext context) => const TenantCreate(),
                // ));
              },
              isLoading: false,
              isEnabled: true,
            ),
          )
        ],
      ),
    );
  }
}
