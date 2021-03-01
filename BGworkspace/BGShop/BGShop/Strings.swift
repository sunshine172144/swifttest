// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum L10n {
  internal enum InfoPlist {
    /// 国际化App名称
    internal static let cfBundleDisplayName = L10n.tr("InfoPlist", "CFBundleDisplayName")
  }
  internal enum LaunchScreen {
  }
  internal enum Localizable {
    /// 点击
    internal static let click = L10n.tr("Localizable", "click")
    /// 首页
    internal static let home = L10n.tr("Localizable", "home")
    /// 我的
    internal static let me = L10n.tr("Localizable", "me")
    /// 业务办理
    internal static let service = L10n.tr("Localizable", "service")
    /// 商城
    internal static let shop = L10n.tr("Localizable", "shop")
    /// 购物车
    internal static let shopCart = L10n.tr("Localizable", "shopCart")
  }
  internal enum Main {
  }
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
