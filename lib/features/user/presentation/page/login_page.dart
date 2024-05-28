import 'package:chat_app/features/app/theme/style.dart';
import 'package:chat_app/features/user/presentation/page/otp_page.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  // String _phoneNumber = "";
  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("84");
  String _countryCode = _selectedFilteredDialogCountry.phoneCode;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "xác minh số điện thoại",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: tabColor,
                    ),
                  ),
                ),
                const Text(
                  "ứng dụng sẽ gửi cho bạn tin nhắn SMS để xác minh số điện thoại của bạn. Nhập mã quốc gia và số điện thoại",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                  onTap: _openFilteredCountryPickerDialog,
                  title: _buildDialogItem(_selectedFilteredDialogCountry),
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.50,
                            color: tabColor,
                          ),
                        ),
                      ),
                      width: 80,
                      height: 42,
                      alignment: Alignment.center,
                      child: Text(_countryCode),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 1.5),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: tabColor, width: 1.5),
                          ),
                        ),
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "số điện thoại",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtpPage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20, top: 10),
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                  color: tabColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    "tiếp tục",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(primaryColor: tabColor),
        child: CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8),
          searchCursorColor: tabColor,
          searchInputDecoration: const InputDecoration(hintText: "tìm kiếm"),
          isSearchable: true,
          title: const Text("chọn mã số điện thoại"),
          onValuePicked: (value) {
            setState(() {
              _selectedFilteredDialogCountry = value;
              _countryCode = value.phoneCode;
            });
          },
          itemBuilder: _buildDialogItem,
        ),
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: tabColor, width: 1.5),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          Text(" +${country.phoneCode}"),
          Expanded(
              child: Text(
            " ${country.name}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          const Spacer(),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

  void _submitVerifyPhoneNumber() {}
}
