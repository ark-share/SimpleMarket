// Generated by Apple Swift version 2.3 (swiftlang-800.10.12 clang-800.0.38)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import ObjectiveC;
@import UIKit;
@import CoreGraphics;
#endif

#import "/Users/macpc/Documents/SimpleMarket/SimpleMarket/SimpleMarket-Bridging-Header.h"

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIViewController;

SWIFT_CLASS("_TtC12SimpleMarket13AppController")
@interface AppController : NSObject
@property (nonatomic, copy) NSString * _Nonnull displayName;
@property (nonatomic) NSInteger buyPayment;
@property (nonatomic, copy) NSString * _Nonnull buyAddress;
- (BOOL)isLogin;
- (void)openLoginView:(UIViewController * _Nonnull)vc;
- (NSString * _Nonnull)getInfoMessageforBuy:(NSString * _Nonnull)status;
- (NSString * _Nonnull)getInfoMessageforSell:(NSString * _Nonnull)status;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC12SimpleMarket11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIColor;
@class NSCoder;

SWIFT_CLASS("_TtC12SimpleMarket12ButtonCustom")
@interface ButtonCustom : UIButton
@property (nonatomic, strong) UIColor * _Nullable textColor;
@property (nonatomic) CGFloat cornerRadius;
@property (nonatomic) CGFloat borderWidth;
@property (nonatomic, strong) UIColor * _Nonnull borderColor;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class OrderData;
@class CommentData;
@class UITableView;
@class NSIndexPath;
@class UITableViewCell;
@class UITextField;
@class UILabel;
@class NSBundle;

SWIFT_CLASS("_TtC12SimpleMarket24CommentAddViewController")
@interface CommentAddViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified tableView;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified commentTextField;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified announceLabel;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified submitButton;
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
@property (nonatomic, copy) NSArray<CommentData *> * _Nonnull commentArray;
- (IBAction)handleSubmitButton:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSDate;
@class FIRDataSnapshot;

SWIFT_CLASS("_TtC12SimpleMarket11CommentData")
@interface CommentData : NSObject
@property (nonatomic, copy) NSString * _Nullable id;
@property (nonatomic, copy) NSString * _Nullable body;
@property (nonatomic, copy) NSString * _Nullable user;
@property (nonatomic, strong) NSDate * _Nullable modified;
@property (nonatomic, strong) NSDate * _Nullable created;
- (nonnull instancetype)initWithSnapshot:(FIRDataSnapshot * _Nonnull)snapshot OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket20CommentTableViewCell")
@interface CommentTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified bodyLabel;
@property (nonatomic, strong) CommentData * _Null_unspecified commentData;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)layoutSubviews;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImagePickerController;
@class AdobeUXImageEditorViewController;
@class UIImage;

SWIFT_CLASS("_TtC12SimpleMarket25ImageSelectViewController")
@interface ImageSelectViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, AdobeUXImageEditorViewControllerDelegate>
- (IBAction)handleLibrary:(id _Nonnull)sender;
- (IBAction)handleCamera:(id _Nonnull)sender;
- (IBAction)handleCancel:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)imagePickerController:(UIImagePickerController * _Nonnull)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> * _Nonnull)info;
- (void)photoEditor:(AdobeUXImageEditorViewController * _Nonnull)editor finishedWithImage:(UIImage * _Nullable)image;
- (void)photoEditorCanceled:(AdobeUXImageEditorViewController * _Nonnull)editor;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIEvent;

SWIFT_CLASS("_TtC12SimpleMarket22LeftMenuViewController")
@interface LeftMenuViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified displayNameLabel;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified loginButton;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified logoutButton;
- (IBAction)handleToTop:(id _Nonnull)sender;
- (IBAction)handleLogin:(id _Nonnull)sender;
- (IBAction)handleLogout:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)makeUserImageButton;
- (void)handleUserImageButton:(UIButton * _Nonnull)sender event:(UIEvent * _Nonnull)event;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket28OrderAddThanksViewController")
@interface OrderAddThanksViewController : UIViewController
- (IBAction)handleOrderAddButton:(id _Nonnull)sender;
- (IBAction)handleOrderIndexButton:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIStoryboardSegue;
@class UIImageView;
@class UITextView;

SWIFT_CLASS("_TtC12SimpleMarket22OrderAddViewController")
@interface OrderAddViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified imageView1;
@property (nonatomic, strong) UIImage * _Null_unspecified image1;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified nameTextField;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified bodyTextView;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified priceTextField;
- (IBAction)handleSubmitButton:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (void)imageTap;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket28OrderBuyThanksViewController")
@interface OrderBuyThanksViewController : UIViewController
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
- (IBAction)handleTradeBuyDetail:(id _Nonnull)sender;
- (IBAction)handleOrderIndex:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class WPYCreditCard;

SWIFT_CLASS("_TtC12SimpleMarket22OrderBuyViewController")
@interface OrderBuyViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified imageView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified paymentLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified addressLabel;
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
@property (nonatomic, readonly, strong) WPYCreditCard * _Nonnull card;
- (IBAction)handlePaymentButton:(id _Nonnull)sender;
- (IBAction)handleAddressButton:(id _Nonnull)sender;
- (IBAction)handleBuyButton:(id _Nonnull)sender;
- (void)charge:(NSString * _Nonnull)token;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class FIRDatabaseReference;

SWIFT_CLASS("_TtC12SimpleMarket9OrderData")
@interface OrderData : NSObject
@property (nonatomic, copy) NSString * _Nullable id;
@property (nonatomic, strong) UIImage * _Nullable image;
@property (nonatomic, copy) NSString * _Nullable imageString;
@property (nonatomic, copy) NSString * _Nullable name;
@property (nonatomic, copy) NSString * _Nullable body;
@property (nonatomic, copy) NSString * _Nullable price;
@property (nonatomic, copy) NSString * _Nullable status;
@property (nonatomic, copy) NSString * _Nullable statusName;
@property (nonatomic, strong) NSDate * _Nullable modified;
@property (nonatomic, strong) NSDate * _Nullable created;
- (nonnull instancetype)initWithSnapshot:(FIRDataSnapshot * _Nonnull)snapshot OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly, strong) FIRDatabaseReference * _Nonnull ref;
- (void)saveField:(NSString * _Nonnull)field value:(NSString * _Nonnull)value;
@end


SWIFT_CLASS("_TtC12SimpleMarket24OrderDetailTableViewCell")
@interface OrderDetailTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified orderImageView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified priceLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified orderDetailButton;
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
- (IBAction)handleOrderDetail:(id _Nonnull)sender;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)layoutSubviews;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket25OrderDetailViewController")
@interface OrderDetailViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified imageView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified priceLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified statusLabel;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified commentButton;
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UICollectionView;
@class UICollectionViewCell;
@class UICollectionViewLayout;

SWIFT_CLASS("_TtC12SimpleMarket34OrderIndexCollectionViewController")
@interface OrderIndexCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>
@property (nonatomic, copy) NSArray<OrderData *> * _Nonnull orderArray;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView * _Nonnull)collectionView;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGSize)collectionView:(UICollectionView * _Nonnull)collectionView layout:(UICollectionViewLayout * _Nonnull)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithCollectionViewLayout:(UICollectionViewLayout * _Nonnull)layout OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIScrollView;
@class UIView;

SWIFT_CLASS("_TtC12SimpleMarket24OrderIndexViewController")
@interface OrderIndexViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified headerView;
@property (nonatomic, weak) IBOutlet UIScrollView * _Null_unspecified scrollView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)makeNavigation;
- (void)makeCollectionViewByPage:(NSInteger)page;
- (void)makeTabButtonByPage:(NSInteger)page;
- (void)handleTabButton:(UIButton * _Nonnull)sender;
- (void)setSelectedButton:(UIButton * _Nonnull)selectButton selected:(BOOL)selected;
- (void)scrollViewDidScroll:(UIScrollView * _Nonnull)scrollView;
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView * _Nonnull)scrollView;
- (void)scrollViewDidEndDecelerating:(UIScrollView * _Nonnull)scrollView;
- (void)makeAddButton;
- (void)handleOrderAddButton:(UIButton * _Nonnull)sender event:(UIEvent * _Nonnull)event;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket28TradeBuyDetailViewController")
@interface TradeBuyDetailViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified statusLabel;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified infoTextView;
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket17TradeBuyIndexCell")
@interface TradeBuyIndexCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified orderImageView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified priceLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified statusLabel;
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)layoutSubviews;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket27TradeBuyIndexViewController")
@interface TradeBuyIndexViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified headerView;
@property (nonatomic, weak) IBOutlet UIScrollView * _Null_unspecified scrollView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)makeNavigation;
- (void)makeTableViewByPage:(NSInteger)page statusArray:(NSArray<NSString *> * _Nonnull)statusArray;
- (void)makeTabButtonByPage:(NSInteger)page title:(NSString * _Nonnull)title;
- (void)handleTabButton:(UIButton * _Nonnull)sender;
- (void)setSelectedButton:(UIButton * _Nonnull)selectButton selected:(BOOL)selected;
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView * _Nonnull)scrollView;
- (void)scrollViewDidEndDecelerating:(UIScrollView * _Nonnull)scrollView;
- (void)makeAddButton;
- (void)handleOrderAddButton:(UIButton * _Nonnull)sender event:(UIEvent * _Nonnull)event;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket27TradeBuyTableViewController")
@interface TradeBuyTableViewController : UITableViewController
@property (nonatomic, copy) NSArray<OrderData *> * _Nonnull orderArray;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull statusArray;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket29TradeSellDetailViewController")
@interface TradeSellDetailViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified statusLabel;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified infoTextView;
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket18TradeSellIndexCell")
@interface TradeSellIndexCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified orderImageView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified priceLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified statusLabel;
@property (nonatomic, strong) OrderData * _Null_unspecified orderData;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (void)layoutSubviews;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket28TradeSellIndexViewController")
@interface TradeSellIndexViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified headerView;
@property (nonatomic, weak) IBOutlet UIScrollView * _Null_unspecified scrollView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)makeNavigation;
- (void)makeTableViewByPage:(NSInteger)page statusArray:(NSArray<NSString *> * _Nonnull)statusArray;
- (void)makeTabButtonByPage:(NSInteger)page title:(NSString * _Nonnull)title;
- (void)handleTabButton:(UIButton * _Nonnull)sender;
- (void)setSelectedButton:(UIButton * _Nonnull)selectButton selected:(BOOL)selected;
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView * _Nonnull)scrollView;
- (void)scrollViewDidEndDecelerating:(UIScrollView * _Nonnull)scrollView;
- (void)makeAddButton;
- (void)handleOrderAddButton:(UIButton * _Nonnull)sender event:(UIEvent * _Nonnull)event;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket28TradeSellTableViewController")
@interface TradeSellTableViewController : UITableViewController
@property (nonatomic, copy) NSArray<OrderData *> * _Nonnull orderArray;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull statusArray;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket23UserLoginViewController")
@interface UserLoginViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified mailAddressText;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified passwordText;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified displayNameText;
- (IBAction)handleLoginButton:(id _Nonnull)sender;
- (IBAction)handleCreateUserButton:(id _Nonnull)sender;
- (void)logout;
- (IBAction)handleBackButton:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket14ViewController")
@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified displayNameLabel;
- (IBAction)handleLoginButton:(id _Nonnull)sender;
- (IBAction)handleLogoutButton:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12SimpleMarket12WebpayClient")
@interface WebpayClient : NSObject
+ (NSString * _Nonnull)publicKey;
+ (NSString * _Nonnull)secretKey;
+ (void)charge:(NSInteger)amount token:(NSString * _Nonnull)token handler:(void (^ _Nonnull)(BOOL))handler;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
