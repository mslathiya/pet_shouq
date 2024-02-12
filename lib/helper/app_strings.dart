import 'package:get/get.dart';

class AppStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "intro_header_one": "Find petcare around your location",
          "intro_message_one":
              "Just turn on your location and you will find the nearest pet care you wish.",
          "intro_header_two": "Find petcare around your location",
          "intro_message_two":
              "Just turn on your location and you will find the nearest pet care you wish.",
          "intro_header_three": "Find petcare around your location",
          "intro_message_three":
              "Just turn on your location and you will find the nearest pet care you wish.",
          "skip": "Skip",
          "welcome_back": "Welcome Back!",
          "login_with_details": "Please log in with your details",
          "lbl_email": "Email Id",
          "hint_email": "Enter email address",
          "lbl_password": "Password",
          "hint_password": "Enter password",
          "remember_me": "Remember me",
          "forgot_password": "Forgot Password",
          "btn_login": "Login",
          "btn_send": "Send",
          "btn_verify": "Verify Now",
          "no_account": "Don't have an account?",
          "sign_up": "Signup",
          "forgot_password_text":
              "We will send mail to the email address you registered to regain you password",
          "otp_verification": "OTP Verification",
          "auth_code_sent": "An authentication code has been sent to",
          "no_code_receive": "I didn't receive code.",
          "btn_resend": "Resend code",
          "time_left": "@count Sec left",
          "reset_link_sent": "Password reset email sent",
          "reset_link_message":
              "An email has been sent to you follow direction in the email to reset password",
          "btn_okay": "Ok",
          "screen_change_password": "Change Password",
          "lbl_old_password": "Old password",
          "hint_old_password": "Enter old password",
          "lbl_new_password": "New password",
          "hint_new_password": "Enter new password",
          "lbl_confirm_password": "Confirm password",
          "hint_confirm_password": "Enter confirm password",
          "btn_submit": "Submit",
          "create_account": "Create New Account",
          "create_account_message":
              "Enter your information below and get started.",
          "type_parent": "Pet Parents",
          "type_vet": "Vet",
          "lbl_parent_name": "Pet Parent Name",
          "lbl_first_name": "First Name",
          "hint_first_name": "Enter First Name",
          "lbl_last_name": "Last Name",
          "hint_last_name": "Enter Last Name",
          "lbl_parent_phone": "Mobile",
          "hint_phone": "Enter number",
          "lbl_gender": "Gender",
          "hint_gender": "Select Gender",
          "lbl_age": "Age",
          "hint_age": "Enter Age",
          "home_address": "Home Address",
          "hint_street_address": "Street Address",
          "hint_street_address_two": "Street Address Line 2",
          "lbl_city": "City",
          "hint_city": "Enter City",
          "lbl_province": "State/Province",
          "hint_province": "Enter State/Province",
          "lbl_secondary_phone": "Secondary Contact Phone Number",
          "lbl_display_name": "Display Name",
          "hint_display_name": "Enter Display Name",
          "lbl_mailing_address": "Mailing Address",
          "hint_mailing_address": "Enter Mailing Address",
          "already_account": "Already have an account?",
          "tab_home": "Home",
          "tab_profile": "Profile",
          "tab_appointment": "Appointment",
          "tab_calendar": "Calendar",
          "tab_pets": "My Pets",
          "location": "Location",
          "hint_location": "Enter Location",
          "opening_time": "Opening Time",
          "btn_add_pet": "Add Pet",
          "btn_edit_pet": "Edit Pet",
          "screen_pet_details": "Pet Details",
          "pet_other_details": "Pet Other Details",
          "chip_number": "Microchip Number",
          "spayed": "is Neutered/Spayed",
          "pedigree_front": "Pedigree Info Frontside",
          "pedigree_back": "Pedigree Info Backside",
          "allergies": "Allergies",
          "description": "Description: ",
          "pet_menu": "PET MENU",
          "medical_history": "Medical history",
          "set_feeding_schedule": "Set Feeding Schedule",
          "diet": "Manage Pet’s Diet Log",
          "nutrition": "Nutrition & Feeding details",
          "medication_details": "Medication details",
          "vaccination": "Vaccination details",
          "special_needs": "Special Need",
          "lbl_pet_name": "Pet Name",
          "hint_pet_name": "Enter Pet Name",
          "lbl_breed": "Breed",
          "hint_breed": "Select Breed",
          "lbl_marking": "Color\\Marking",
          "hint_marking": "Enter body color",
          "lbl_birth_date": "Birth Date",
          "hint_birth_date": "Select birth date",
          "lbl_weight": "Weight in Kg",
          "hint_weight": "Enter Weight",
          "lbl_height": "Height",
          "hint_height": "Enter Height",
          "lbl_chip_no": "Microchip Number",
          "hint_chip_no": "Enter Microchip Number",
          "lbl_spayed": "Is Neutered/Spayed",
          "hint_spayed": "Select Neutered/Spayed",
          "lbl_pedigree_front": "Pedigree Info Frontside",
          "hint_pedigree_front": "Enter Pedigree Info Frontside",
          "lbl_pedigree_back": "Pedigree Info Backside",
          "hint_pedigree_back": "Pedigree Info Backside",
          "lbl_allergies": "Allergies",
          "hint_allergies": "Enter Allergies",
          "pet_taker_address": "Pet Care Taker Address (If different)",
          "lbl_description": "Description",
          "hint_description": "Enter description",
          "lbl_qr_code": "QR Code",
          "hint_qr_code": "Enter QR Code",
          "account": "Account",
          "screen_notifications": "Notifications",
          "screen_privacy_policy": "Privacy Policy",
          "screen_terms": "Terms & Conditions",
          "screen_contact_us": "Contact Us",
          "screen_faq": "FAQ",
          "help": "Help",
          "btn_delete_account": "Delete Account",
          "btn_logout": "Logout",
          "screen_edit_profile": "Edit Profile",
          "btn_save": "Save",
          "pet_medication": "Pet Medication",
          "btn_add_medication": "Add Pet Medication Details",
          "date_nutrition": "Date & Duration",
          "prescription_reason": "Reason for Prescription",
          "administrative_info": "Administration Instructions",
          "special_notes": "Special Notes",
          "lbl_medication_name": "Medication Name",
          "hint_medication_name": "Enter Medication Name",
          "lbl_medication_type": "Medication Type",
          "hint_medication_type": "Select Medication Type",
          "lbl_veterinarian": "Prescribing Veterinarian",
          "hint_veterinarian": "Enter Prescribing Veterinarian name",
          "lbl_species": "Pet's Species",
          "hint_species": "Enter Pet's Species",
          "lbl_dosage": "Dosage",
          "hint_dosage": "Enter Dosage",
          "lbl_frequency": "Frequency",
          "hint_frequency": "Enter Frequency",
          "lbl_duration": "Duration",
          "hint_duration": "Enter Duration",
          "hint_prescription_reason": "Enter Reason for Prescription",
          "hint_administrative_info": "Enter Administration Instructions",
          "lbl_start_date": "Start Date",
          "hint_select_date": "Select Date",
          "lbl_end_date": "End Date",
          "lbl_refills": "Refills",
          "hint_refills": "Enter Refills",
          "hint_special_note": "Enter Special Notes",
          "screen_add_medication": "Add Pet Medication",
          "screen_update_medication": "Update Pet Medication",
          "food_type": "Food Type",
          "portion_size": "Portion Size",
          "special_instruction": "Special Instructions",
          "weight": "Weight",
          "lbl_food_type": "Food Name",
          "hint_food_type": "Enter Food Name",
          "date": "Date",
          "time": "Time",
          "lbl_meal_time": "Meal Time",
          "hint_meal_time": "Select Meal Time",
          "lbl_portion_size": "Portion Size",
          "hint_portion_size": "Enter Portion Size",
          "lbl_special_instruction": "Special Instructions",
          "hint_special_instruction": "Enter Special Instructions",
          "lbl_water": "Water",
          "hint_water": "Select Water",
          "lbl_weight_value": "Weight (if applicable)",
          "screen_diet_log": "Pet Diet Log",
          "screen_diet_log_details": "Pet Diet Log Details",
          "screen_add_diet_log": "Add Pet Diet Log",
          "screen_update_diet_log": "Update Pet Diet Log",
          "nutrition_feeding": "Pet Nutrition & Feeding",
          "screen_nutrition_details": "Nutrition Details",
          "screen_nutrition_feeding": "Add Pet Nutrition & Feeding",
          "edit_screen_nutrition_feeding": "Update Pet Nutrition & Feeding",
          "per_pound": "Per Pound",
          "ingredients": "Ingredients",
          "other_nutrition_detail": "Nutrition & Feeding Other Details",
          "nutrition_content": "Nutritional Content (per 100g)",
          "protein": "Protein",
          "fat": "Fat",
          "carbohydrates": "Carbohydrates",
          "fiber": "Fiber",
          "calories": "Calories",
          "vitamins": "Vitamins",
          "minerals": "Minerals",
          "omega_three": "Omega-3 Fatty Acids",
          "omega_six": "Omega-6 Fatty Acids",
          "guidelines": "Feeding Guidelines",
          "small_breed": "Small Breed Puppy (1-10 lbs)",
          "large_breed": "Large Breed Puppy (50+ lbs)",
          "special_feature": "Special Features",
          "edit_details": "Edit Details",
          "lbl_food_name": "Food Name",
          "hint_food_name": "Enter Food Name",
          "lbl_brand": "Brand",
          "hint_brand": "Enter Brand Name",
          "lbl_life_stage": "Life Stage",
          "hint_life_stage": "Enter Life Stage",
          "hint_ingredients": "Enter Ingredients",
          "lbl_nutrition_content": "Nutritional Content",
          "hint_nutrition_content": "Enter Content",
          "per_gram": "Per @value g",
          "hint_protein": "Enter Protein",
          "hint_fat": "Enter Fat",
          "hint_carbohydrates": "Enter Carbohydrates",
          "hint_fiber": "Enter Fiber",
          "hint_calories": "Enter Calories",
          "hint_vitamins": "Enter Vitamins",
          "hint_mineral": "Enter Minerals",
          "hint_omega_three": "Enter Omega-3",
          "hint_omega_six": "Enter Omega-6",
          "lbl_guideline": "Guidelines",
          "hint_guideline": "Enter Guidelines",
          "hint_lbs": "Enter Lbs",
          "hint_feature": "Enter Special Features",
          "lbl_price": "Price",
          "hint_price": "Enter Price",
          "screen_add_feed_schedule": "Add Feeding Schedule",
          "lbl_title": "Title",
          "hint_title": "Enter title",
          "lbl_note": "Note",
          "hint_note": "Enter Note",
          "type_single": "One Day",
          "type_multiple": "Custom",
          "repeat": "Repeat",
          "btn_cancel": "Cancel",
          "btn_no_repeat": "Do not repeat any more",
          "btn_off_tomorrow": "Turn off for tomorrow",
          "screen_feeding_schedule": "Feeding Schedule",
          "screen_booking_history": "Booking History",
          "screen_appointment_detail": "Appointment Details",
          "screen_appointment_booking": "Appointment Booking",
          "disease": "Disease",
          "hint_disease": "Enter Disease",
          "btn_reschedule_appointment": "Reschedule Appointment",
          "lbl_doctor_name": "Doctor Name",
          "hint_doctor_name": "Select Doctor Name",
          "btn_reschedule": "Reschedule",
          "btn_book_now": "Book Now",
          "lbl_dog_name": "Dog Name",
          "hint_dog_name": "Select Dog Name",
          "btn_confirm_booking": "Confirm",
          "mark_read": "Mark all as read",
          "lbl_name": "Name",
          "hint_name": "Enter Name",
          "lbl_message": "Message",
          "hint_message": "Enter Message",
          "lbl_phone_number": "Phone Number",
          "message_logout": "Are you sure you want to logout ?",
          "account_deletion": "Account deletion",
          "account_deletion_message": "Are You sure you want to delete?",
          "btn_delete": "Delete",
          "screen_details": "Details",
          "screen_detail_page": "Detail page",
          "screen_appointments": "Appointments",
          "current_appointment": "Current Appointments",
          "tab_current": "Current",
          "tab_upcoming": "Upcoming",
          "tab_past": "Past",
          "tab_cancelled": "Cancelled",
          "date_time": "Date & TIme",
          "btn_reject": "Reject",
          "btn_accept": "Accept",
          "medical_details": "Medical Details",
          "pet_vaccination_detail": "Pet Vaccination Details",
          "vaccination_name": "Vaccination Name",
          "vaccination_type": "Vaccination Type",
          "vaccination_date": "Vaccination Date",
          "next_due_date": "Next Due Date",
          "vaccination_provider": "Vaccination Provider",
          "vaccination_lot_no": "Vaccination Lot Number",
          "vaccination_id": "Vaccination Certificate ID",
          "breed_marking": "Breed & Color/Markings",
          "emergency_info": "Emergency Contact Information",
          "primary_doc": "Primary Veterinarian",
          "primary_hospital": "Emergency Animal Hospital",
          "vaccination_record": "Vaccination Records",
          "medications": "Medications",
          "old_illness": "Previous Illnesses/Injuries",
          "food_allergies": "Food Allergy",
          "medication_allergy": "Medication Allergy",
          "chronic_conditions": "Chronic Conditions",
          "chronic_condition": "Chronic Condition",
          "medication": "Medication",
          "special_diet": "Special Diet",
          "dietary_info": "Dietary Information",
          "dog_food": "Dog Food",
          "feeding_schedule": "Feeding Schedule",
          "dietary_restriction": "Dietary Restrictions",
          "parasite_control": "Parasite Control",
          "flea_tick_control": "Flea/Tick Control",
          "heartworm_prevention": "Heartworm Prevention",
          "dental_care": "Dental Care",
          "dental_cleaning": "Dental Cleaning",
          "dental_issues": "Dental Issues",
          "vet_visits": "Vet Visits",
          "last_visit": "Last Visit",
          "reason": "Reason",
          "behavior_training": "Behavior and Training",
          "behavior_note": "Behavior Notes",
          "training_progress": "Training Progress",
          "grooming_hygiene": "Grooming and Hygiene",
          "grooming_needs": "Grooming Needs",
          "miscellaneous_note": "Miscellaneous Notes",
          "miscellaneous": "Miscellaneous",
          "pet_medication_details": "Pet Medication Details",
          "nutrition_feeding_details": "Pet Nutrition & Feeding Details",
          "morning_feeding": "Morning Feeding",
          "afternoon_feeding": "Afternoon Feeding",
          "evening_feeding": "Evening Feeding",
          "example": "Example",
          "bedtime_snack": "Bedtime Snack (Optional)",
          "specialization": "Specialization",
          "lbl_veterinarian_name": "Veterinarian Name",
          "veterinarian_special": "Veterinarian Specialist",
          "hint_specialty": "Enter Specialist",
          "lbl_qualification": "Qualification",
          "hint_qualification": "Enter Qualification",
          "lbl_profile_summary": "Profile Summary",
          "hint_summary": "Enter Profile Summary",
          "lbl_license_no": "License Number",
          "hint_license_no": "Enter License Number",
          "lbl_license_start_date": "License Start Date",
          "lbl_license_end_date": "License Expiration Date",
          "lbl_document": "Document",
          "hint_document": "Upload Document",
          "lbl_experience": "Years of Experience",
          "hint_experience": "Enter Years of Experience",
          "lbl_language_spoken": "Languages Spoken",
          "hint_languages": "Enter Languages Spoken",
          "lbl_consent": "Consent & Release",
          "hint_consent": "Enter Consent & Release",
          "lbl_address": "Address",
          "hint_address": "Enter Address",
          "lbl_country": "Country",
          "hint_country": "Enter Country",
          "lbl_zip": "Zip Code",
          "hint_zip_code": "Enter Zip Code",
          "lbl_state": "State",
          "hint_state": "Enter State",
          "availability": "Availability",
          "add_availability": "Add Availability",
          "closed": "Closed",
          "start_time": "Start Time",
          "end_time": "End Time",
          "remove": "Remove",
          "monday": "Monday",
          "tuesday": "Tuesday",
          "wednesday": "Wednesday",
          "thursday": "Thursday",
          "friday": "Friday",
          "saturday": "Saturday",
          "sunday": "Sunday",
          "screen_add_special_notes": "Add Special Needs",
          "dynamic_field_required": "@field is required",
          "invalid_email": "Entered email address is not valid",
          "camera": "Camera",
          "gallery": "Gallery",
          "file_selected": "File selected successfully",
          "error_in_request": "Error in request",
          "lbl_diet_time": "Diet Time",
          "something_wrong": "Something goes wrong",
          "congratulations": "Congratulations",
          "years": "Years",
          "error_msg": "Please check all request field",
          "delete_item": "Remove selected item?",
          "delete_item_msg": "Are you sure you want to remove?",
          "add_pet_msg": "Add new pet by click on below button!",
          "no_pet_found": "No Pet's found",
          "add_nutrition_msg":
              "Add new nutrition/feeding by click on below button!",
          "no_nutrition_found": "No nutrition/feeding data found",
          "add_medication_msg": "Add new medication by click on below button!",
          "no_medication_found": "No medication data found",
          "password_not_matched": "Password is not matched",
          "password_week":
              "Password must contain one special later and 8 character long",
          "add_diet_msg": "Add new diet log by click on below button!",
          "no_diet_found": "No diet log data found",
          "phone_not_valid": "Entered phone number not belongs to country",
          "auth_code_invalid": "The provided code is not valid.",
          "common_auth_error": "Error while verifying your self.",
          "code_sent": "Auth code sent",
          "code_sent_msg": "Auth code sent successfully",
          "short_auth_code": "Auth code is not valid",
          "short_auth_code_msg":
              "Auth code is not complete. Please add completely"
        },
      };
}
