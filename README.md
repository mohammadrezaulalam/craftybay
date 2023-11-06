**CraftyBay - Powering Your Tomorrow, Today**


|  		           **Overview**              |

CraftyBay, your tech haven! Explore a world of cutting-edge electronics and gadgets. From state-of-the-art smartphones to smart home devices, CraftyBay is your gateway to innovation. Our handpicked selection combines top-tier performance with sleek design. Elevate your lifestyle, stay connected, and enjoy the latest tech trends with CraftyBay. Shop now and immerse yourself in the world of tomorrow's gadgets, today.


|        **Feature-based MVP Atchitecture**      |


MVP (Model-View-Presenter) is an architectural pattern that can be applied to Flutter code, just as it can be used in various other programming languages and frameworks. The primary benefits of using the MVP architecture in a Flutter codebase include:

Separation of Concerns: MVP enforces a clear separation of concerns, which makes your codebase more organized and maintainable. It divides your code into three distinct components: Model, View, and Presenter. The Model represents the data and business logic, the View represents the user interface, and the Presenter acts as an intermediary that handles user input and updates the View based on changes in the Model. This separation simplifies code comprehension and maintenance.

Testability: MVP promotes high testability. Since the business logic is concentrated in the Presenter, you can write unit tests for the Presenter to ensure that it behaves correctly under different scenarios. This testing approach allows you to identify and fix issues more easily and provides a safety net for making changes or adding new features.

Reusability: The separation of concerns in MVP makes it easier to reuse components. For instance, you can reuse the same Presenter with different Views, or you can use the same Model in multiple presenters. This reusability can save development time and effort when building different parts of your application.

Scalability: MVP supports the growth and scalability of your Flutter application. As your app becomes more complex, you can add new presenters and views without affecting the existing codebase. This makes it easier to manage large codebases and extend the functionality of your app.

Maintenance and Updates: MVP simplifies maintenance and updates. You can work on individual components without disrupting the entire application. This is especially valuable for teams working on different parts of the codebase, as they can make changes independently.

Flexibility: MVP provides flexibility in terms of UI design and user experience. You can update the View without affecting the underlying business logic, making it easier to iterate on the user interface and adapt to changing design requirements.

Collaboration: Different teams or developers can work on the Model, View, and Presenter components simultaneously, making it easier to parallelize development tasks and collaborate effectively.

User Experience: MVP helps maintain a responsive and smooth user experience because the business logic is separated from the UI. Even if the UI is busy rendering complex views, the Presenter can continue to respond to user input and update the UI when needed.

Documentation and Understanding: MVP's well-defined structure makes it easier to document your code and explain the architecture to other team members or stakeholders. This ensures that the codebase remains understandable and maintainable over time.

While MVP is a beneficial architecture for many Flutter applications, it's essential to choose the architecture that best suits your specific project requirements and development team's familiarity. Other popular Flutter architecture patterns include BLoC (Business Logic Component), Provider, Redux, and MobX, each with its own strengths and use cases.


|  		          **Features**		           |

- **User Authentication**: Register and log in securely.
- **Product Browsing**: Explore a vast collection of crafting supplies.
- **Product Details**: View detailed product information.
- **Shopping Cart**: Add and manage items in your shopping cart.
- **Wishlist**: Save favorite products for later.
- **User Profile**: Update personal information with ease.
- **Responsive Design**: CraftyBay is designed for mobile and web platforms.



|  		      **Project Structure**	         |

CraftyBay follows a well-organized project structure for maintainability and scalability:

```
  .
└── crafty_bay/
    ├── assets/
    │   ├── images/
    │   │   ├── logo.svg
    │   │   ├── logo_nav.svg
    │   │   └── shoe.png
    └── lib/
        ├── application/
        │   ├── app.dart
        │   └── state_holder_binder.dart
        ├── data/
        │   ├── models/
        │   │   ├── brand.dart
        │   │   ├── cart_list_model.dart
        │   │   ├── category_data.dart
        │   │   ├── category_model.dart
        │   │   ├── create_wishlist_data.dart
        │   │   ├── create_wishlist_model.dart
        │   │   ├── invoice_create_response_model.dart
        │   │   ├── network_response.dart
        │   │   ├── payment_method.dart
        │   │   ├── product.dart
        │   │   ├── product_details.dart
        │   │   ├── product_details_model.dart
        │   │   ├── product_model.dart
        │   │   ├── product_review_list_model.dart
        │   │   ├── product_wishlist_model.dart
        │   │   ├── read_user_profile_model.dart
        │   │   ├── review_data.dart
        │   │   ├── slider_data.dart
        │   │   ├── slider_model.dart
        │   │   ├── user_profile_data.dart
        │   │   └── wishlist_data.dart
        │   ├── services/
        │   │   └── network_caller.dart
        │   └── utility/
        │       └── urls.dart
        ├── presentation/
        │   ├── state_holders/
        │   │   ├── add_to_cart_controller.dart
        │   │   ├── auth_controller.dart
        │   │   ├── cart_list_controller.dart
        │   │   ├── category_controller.dart
        │   │   ├── complete_profile_controller.dart
        │   │   ├── create_invoice_controller.dart
        │   │   ├── create_product_review_controller.dart
        │   │   ├── create_wishlist_controller.dart
        │   │   ├── email_verification_controller.dart
        │   │   ├── home_slider_controller.dart
        │   │   ├── logout_controller.dart
        │   │   ├── main_bottom_nav_controller.dart
        │   │   ├── new_product_controller.dart
        │   │   ├── otp_verification_controller.dart
        │   │   ├── popular_product_controller.dart
        │   │   ├── product_details_controller.dart
        │   │   ├── product_list_controller.dart
        │   │   ├── product_review_list_controller.dart
        │   │   ├── read_profile_data_controller.dart
        │   │   ├── read_wishlist_controller.dart
        │   │   └── special_product_controller.dart
        │   └── ui/
        │       ├── screens/
        │       │   ├── auth/
        │       │   │   ├── complete_profile_screen.dart
        │       │   │   ├── email_verification_screen.dart
        │       │   │   └── otp_verification_screen.dart
        │       │   ├── cart_screen.dart
        │       │   ├── category_list_screen.dart
        │       │   ├── checkout_screen.dart
        │       │   ├── create_review_screen.dart
        │       │   ├── home_screen.dart
        │       │   ├── main_bottom_nav_screen.dart
        │       │   ├── product_details_screen.dart
        │       │   ├── product_list_screen.dart
        │       │   ├── review_list_screen.dart
        │       │   ├── splash_screen.dart
        │       │   ├── webview_screen.dart
        │       │   └── wish_list_screen.dart
        │       ├── utils/
        │       │   ├── theme/
        │       │   │   ├── theme_service.dart
        │       │   │   └── themes.dart
        │       │   ├── app_colors.dart
        │       │   ├── color_extension.dart
        │       │   ├── image_assets.dart
        │       │   └── timer_controller.dart
        │       └── widgets/
        │           ├── home/
        │           │   ├── home_slider.dart
        │           │   ├── product_image_slider.dart
        │           │   └── section_header.dart
        │           ├── cart_product_card.dart
        │           ├── category_card.dart
        │           ├── circular_icon_button.dart
        │           ├── custom_stepper.dart
        │           ├── product_card.dart
        │           ├── review_card.dart
        │           ├── size_picker.dart
        │           └── wishlist_product_card.dart
        └── main.dart
```




|  		         **Installation**		         |



Follow these steps to run the CraftyBay Application:

1. Clone this repository to your local machine:

git clone https://github.com/mohammadrezaulalam/craftybay.git

2. Navigate to the project folder:

cd ecommerce

3. Install dependencies:

flutter pub get


|  		      **Installable APK**		         |


[Click Here to download APK](https://drive.google.com/file/d/1DEGAYdnjBy4n5PxUUKGO9TJsUgU7dDen/view?usp=sharing)



|  		         **Dependencies**		         |


These dependencies in CraftyBay ecommerce application, enhance its functionality and user experience in various ways:

flutter_svg (^2.0.7): This package allows CraftyBay to seamlessly incorporate Scalable Vector Graphics (SVG) into the app. It can enable SVG images for sharp and high-quality graphics, which is essential for displaying product images, icons, or logos in your application.

get (^4.6.5): The "get" package is a state management solution that simplifies the management of app states, navigation, and dependency injection. It helps organize your code, making it more maintainable and efficient.

pin_code_fields (^8.0.1): This package enables app to create a secure and user-friendly way for customers to enter PIN codes or verification codes during the checkout process, ensuring data security and ease of use.

carousel_slider (^4.2.1): This package lets implement image carousels or sliders, perfect for showcasing featured products, promotions, or new arrivals. It engages users with interactive and visually appealing content.

http (^1.1.0): The HTTP package is crucial for making network requests to retrieve product data from your server or external APIs. It's the backbone for fetching product information, images, and other dynamic content.

shared_preferences (^2.2.2): To provide a personalized experience, shared preferences are used to store user-specific settings or preferences, such as user language preferences, theme choices, or shopping cart details.

connectivity_plus (^5.0.1): This package helps ensure a seamless shopping experience by checking and monitoring the device's network connectivity. It's essential to handle offline scenarios and provide real-time updates to users.

webview_flutter (^4.4.1): This package is vital for rendering web pages within the app. It can be used for displaying payment method choices page, terms and conditions, privacy policies, or external content without leaving the app.

flutter_rating_bar (^4.0.1): Customer reviews and ratings play a significant role in building trust and making purchase decisions. This package simplifies the implementation of a rating system, enabling users to rate products and leave feedback.

get_storage (^2.1.1): Get Storage is a powerful package for efficient, lightweight, and persistent key-value storage. It can be used to store user preferences, session data, and even cached content, offering a fast and reliable way to manage data that needs to persist between app sessions. 

By incorporating these dependencies into the ecommerce app, CraftyBay provides users with an enriched shopping experience, offering high-quality visuals, a smooth and secure checkout process, network resilience, and personalized interactions, all of which contribute to higher user satisfaction and engagement in your ecommerce application.



|  		           **Liecense**	             |

This project is licensed under the MIT License. See
the [LICENSE](https://opensource.org/license/mit/) file for details.





|  		        **Screenshots**	        	   |

![all-min](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/6ed58ed4-f6aa-4b5c-b1d5-c5cd08722029)


![Screenshot_20231105_184129](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/7fb3cc49-2e01-4ced-b3b5-95e6989b5fff)


![Screenshot_20231105_185559](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/061e05e8-eb11-4cbd-9643-5b2e7cd60e87)



![Screenshot_20231105_183205](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/69b58d2f-2bff-4b4a-b009-93cd30226420)



![Screenshot_20231105_193454](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/c88139b4-b7bf-407d-9d91-e7c3acc69a54)


![Screenshot_20231105_193643](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/c6df8f88-6db4-4f3c-b9fe-5a0fe00f8797)



![Screenshot_20231105_193213](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/e235f12b-1425-454f-acf7-614839e71fe1)


![Screenshot_20231105_193230](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/49e53417-305b-4c5f-b57a-c88f98e7f5f5)



![Screenshot_20231105_193244](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/da1357d0-bdfc-4487-8be1-fb0d2b8faf31)


![Screenshot_20231105_183537](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/8dbf4810-bd86-4f8e-8dba-48446d998b28)


![Screenshot_20231105_193937](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/02c2f4cd-3fb9-4f31-991d-dd85155b962a)


![Screenshot_20231105_194019](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/7266e6e0-8633-4854-a690-4b6e39c8a1b7)



![Screenshot_20231105_194056](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/aa16a42f-4d7e-467b-83e4-1a5179862174)



![Screenshot_20231105_194139](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/8fbf564c-4592-45ac-a9f0-af77811b2b51)


![Screenshot_20231105_183434](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/d729f4db-8f63-4284-9a6a-fd7e64c97cf0)


![Screenshot_20231105_183552](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/5081cbf2-87e3-4da0-b8df-37ab30fa6882)


![Screenshot_20231105_183620](https://github.com/mohammadrezaulalam/craftybay/assets/128355921/7b3a4c88-e02a-4fab-85fe-9c3e52868435)



