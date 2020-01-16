# Swenson He Currency Converter Coding Challenge using MVVM, Moya, SwiftUI and Combine
==================================================================

This application displays all the currencies available and it's conversion rates from [Fixer.io API](https://fixer.io/documentation).

Libraries / Technologies Used
------------------------------

  - Moya: Networking library inspired by the concept of encapsulating network requests in type-safe way
  - SwiftUI: A modern way to declare user interfaces for any Apple platform
  - Combine: The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events.
  - MVVM: Model-View-ViewModel design pattern that provides uncoupling and play nicely with Reactive Programming

Features
---------

 - Home: list of currencies (including currency name and conversion rate). Loads the currencies at start. The base currency is loaded at the top.
 - Currency Detail: currency converter from base currency to the chosen currency. 
