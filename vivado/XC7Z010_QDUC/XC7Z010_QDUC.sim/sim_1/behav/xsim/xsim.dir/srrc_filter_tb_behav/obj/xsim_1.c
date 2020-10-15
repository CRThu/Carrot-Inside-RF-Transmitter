/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_3579(char*, char *);
extern void execute_3580(char*, char *);
extern void execute_3581(char*, char *);
extern void execute_3582(char*, char *);
extern void execute_3590(char*, char *);
extern void execute_3591(char*, char *);
extern void execute_3592(char*, char *);
extern void execute_3593(char*, char *);
extern void execute_3587(char*, char *);
extern void execute_3588(char*, char *);
extern void execute_3589(char*, char *);
extern void execute_165(char*, char *);
extern void execute_166(char*, char *);
extern void execute_167(char*, char *);
extern void execute_3554(char*, char *);
extern void execute_3555(char*, char *);
extern void execute_3556(char*, char *);
extern void execute_3557(char*, char *);
extern void execute_3569(char*, char *);
extern void execute_3570(char*, char *);
extern void execute_3571(char*, char *);
extern void execute_3572(char*, char *);
extern void execute_3573(char*, char *);
extern void execute_3574(char*, char *);
extern void execute_170(char*, char *);
extern void execute_172(char*, char *);
extern void execute_175(char*, char *);
extern void execute_176(char*, char *);
extern void execute_180(char*, char *);
extern void execute_179(char*, char *);
extern void execute_184(char*, char *);
extern void execute_202(char*, char *);
extern void execute_254(char*, char *);
extern void execute_264(char*, char *);
extern void execute_211(char*, char *);
extern void execute_294(char*, char *);
extern void execute_295(char*, char *);
extern void execute_296(char*, char *);
extern void execute_301(char*, char *);
extern void execute_302(char*, char *);
extern void execute_303(char*, char *);
extern void execute_304(char*, char *);
extern void execute_305(char*, char *);
extern void execute_306(char*, char *);
extern void execute_326(char*, char *);
extern void execute_327(char*, char *);
extern void execute_328(char*, char *);
extern void execute_332(char*, char *);
extern void execute_353(char*, char *);
extern void execute_354(char*, char *);
extern void execute_355(char*, char *);
extern void execute_359(char*, char *);
extern void execute_380(char*, char *);
extern void execute_381(char*, char *);
extern void execute_382(char*, char *);
extern void execute_386(char*, char *);
extern void execute_390(char*, char *);
extern void execute_1954(char*, char *);
extern void execute_1955(char*, char *);
extern void execute_392(char*, char *);
extern void execute_393(char*, char *);
extern void execute_433(char*, char *);
extern void execute_472(char*, char *);
extern void execute_477(char*, char *);
extern void execute_478(char*, char *);
extern void execute_586(char*, char *);
extern void execute_589(char*, char *);
extern void execute_613(char*, char *);
extern void execute_637(char*, char *);
extern void execute_661(char*, char *);
extern void execute_687(char*, char *);
extern void execute_688(char*, char *);
extern void execute_689(char*, char *);
extern void execute_691(char*, char *);
extern void execute_696(char*, char *);
extern void execute_972(char*, char *);
extern void execute_973(char*, char *);
extern void execute_976(char*, char *);
extern void execute_977(char*, char *);
extern void execute_978(char*, char *);
extern void execute_980(char*, char *);
extern void execute_985(char*, char *);
extern void execute_1226(char*, char *);
extern void execute_1227(char*, char *);
extern void execute_1228(char*, char *);
extern void execute_1230(char*, char *);
extern void execute_1235(char*, char *);
extern void execute_1476(char*, char *);
extern void execute_1477(char*, char *);
extern void execute_1478(char*, char *);
extern void execute_1482(char*, char *);
extern void execute_1485(char*, char *);
extern void execute_1732(char*, char *);
extern void execute_1733(char*, char *);
extern void execute_1951(char*, char *);
extern void execute_1957(char*, char *);
extern void execute_3394(char*, char *);
extern void execute_3395(char*, char *);
extern void execute_1959(char*, char *);
extern void execute_1960(char*, char *);
extern void execute_1966(char*, char *);
extern void execute_1967(char*, char *);
extern void execute_2075(char*, char *);
extern void execute_2078(char*, char *);
extern void execute_2102(char*, char *);
extern void execute_2126(char*, char *);
extern void execute_2150(char*, char *);
extern void execute_2177(char*, char *);
extern void execute_2182(char*, char *);
extern void execute_2421(char*, char *);
extern void execute_2422(char*, char *);
extern void execute_2426(char*, char *);
extern void execute_2431(char*, char *);
extern void execute_2673(char*, char *);
extern void execute_2678(char*, char *);
extern void execute_2922(char*, char *);
extern void execute_2925(char*, char *);
extern void execute_3172(char*, char *);
extern void execute_3173(char*, char *);
extern void execute_3391(char*, char *);
extern void execute_3468(char*, char *);
extern void execute_3508(char*, char *);
extern void execute_3509(char*, char *);
extern void execute_3471(char*, char *);
extern void execute_3472(char*, char *);
extern void execute_3517(char*, char *);
extern void execute_3518(char*, char *);
extern void execute_3522(char*, char *);
extern void execute_3523(char*, char *);
extern void execute_3527(char*, char *);
extern void execute_3528(char*, char *);
extern void execute_3530(char*, char *);
extern void execute_3540(char*, char *);
extern void execute_3551(char*, char *);
extern void execute_3559(char*, char *);
extern void execute_3560(char*, char *);
extern void execute_3561(char*, char *);
extern void execute_3562(char*, char *);
extern void execute_3563(char*, char *);
extern void execute_3564(char*, char *);
extern void execute_3567(char*, char *);
extern void execute_196(char*, char *);
extern void execute_198(char*, char *);
extern void execute_199(char*, char *);
extern void execute_206(char*, char *);
extern void execute_207(char*, char *);
extern void execute_208(char*, char *);
extern void execute_224(char*, char *);
extern void execute_225(char*, char *);
extern void execute_226(char*, char *);
extern void execute_241(char*, char *);
extern void execute_242(char*, char *);
extern void execute_243(char*, char *);
extern void execute_280(char*, char *);
extern void execute_281(char*, char *);
extern void execute_287(char*, char *);
extern void execute_290(char*, char *);
extern void execute_397(char*, char *);
extern void execute_398(char*, char *);
extern void execute_399(char*, char *);
extern void execute_400(char*, char *);
extern void execute_404(char*, char *);
extern void execute_405(char*, char *);
extern void execute_406(char*, char *);
extern void execute_403(char*, char *);
extern void execute_409(char*, char *);
extern void execute_420(char*, char *);
extern void execute_418(char*, char *);
extern void execute_416(char*, char *);
extern void execute_432(char*, char *);
extern void execute_430(char*, char *);
extern void execute_428(char*, char *);
extern void execute_436(char*, char *);
extern void execute_437(char*, char *);
extern void execute_438(char*, char *);
extern void execute_439(char*, char *);
extern void execute_443(char*, char *);
extern void execute_444(char*, char *);
extern void execute_445(char*, char *);
extern void execute_442(char*, char *);
extern void execute_448(char*, char *);
extern void execute_459(char*, char *);
extern void execute_457(char*, char *);
extern void execute_455(char*, char *);
extern void execute_471(char*, char *);
extern void execute_469(char*, char *);
extern void execute_467(char*, char *);
extern void execute_482(char*, char *);
extern void execute_493(char*, char *);
extern void execute_487(char*, char *);
extern void execute_488(char*, char *);
extern void execute_489(char*, char *);
extern void execute_503(char*, char *);
extern void execute_505(char*, char *);
extern void execute_506(char*, char *);
extern void execute_532(char*, char *);
extern void execute_534(char*, char *);
extern void execute_535(char*, char *);
extern void execute_577(char*, char *);
extern void execute_580(char*, char *);
extern void execute_592(char*, char *);
extern void execute_595(char*, char *);
extern void execute_607(char*, char *);
extern void execute_608(char*, char *);
extern void execute_598(char*, char *);
extern void execute_600(char*, char *);
extern void execute_605(char*, char *);
extern void execute_610(char*, char *);
extern void execute_664(char*, char *);
extern void execute_667(char*, char *);
extern void execute_679(char*, char *);
extern void execute_680(char*, char *);
extern void execute_670(char*, char *);
extern void execute_673(char*, char *);
extern void execute_677(char*, char *);
extern void execute_682(char*, char *);
extern void execute_701(char*, char *);
extern void execute_702(char*, char *);
extern void execute_740(char*, char *);
extern void execute_970(char*, char *);
extern void execute_705(char*, char *);
extern void execute_715(char*, char *);
extern void execute_734(char*, char *);
extern void execute_737(char*, char *);
extern void execute_743(char*, char *);
extern void execute_745(char*, char *);
extern void execute_772(char*, char *);
extern void execute_773(char*, char *);
extern void execute_774(char*, char *);
extern void execute_775(char*, char *);
extern void execute_776(char*, char *);
extern void execute_777(char*, char *);
extern void execute_778(char*, char *);
extern void execute_779(char*, char *);
extern void execute_780(char*, char *);
extern void execute_781(char*, char *);
extern void execute_782(char*, char *);
extern void execute_783(char*, char *);
extern void execute_784(char*, char *);
extern void execute_785(char*, char *);
extern void execute_786(char*, char *);
extern void execute_787(char*, char *);
extern void execute_788(char*, char *);
extern void execute_963(char*, char *);
extern void execute_964(char*, char *);
extern void execute_966(char*, char *);
extern void execute_831(char*, char *);
extern void execute_832(char*, char *);
extern void execute_833(char*, char *);
extern void execute_834(char*, char *);
extern void execute_835(char*, char *);
extern void execute_836(char*, char *);
extern void execute_837(char*, char *);
extern void execute_838(char*, char *);
extern void execute_839(char*, char *);
extern void execute_840(char*, char *);
extern void execute_841(char*, char *);
extern void execute_842(char*, char *);
extern void execute_843(char*, char *);
extern void execute_844(char*, char *);
extern void execute_845(char*, char *);
extern void execute_846(char*, char *);
extern void execute_847(char*, char *);
extern void execute_848(char*, char *);
extern void execute_849(char*, char *);
extern void execute_850(char*, char *);
extern void execute_851(char*, char *);
extern void execute_852(char*, char *);
extern void execute_853(char*, char *);
extern void execute_854(char*, char *);
extern void execute_855(char*, char *);
extern void execute_856(char*, char *);
extern void execute_857(char*, char *);
extern void execute_858(char*, char *);
extern void execute_859(char*, char *);
extern void execute_860(char*, char *);
extern void execute_861(char*, char *);
extern void execute_862(char*, char *);
extern void execute_863(char*, char *);
extern void execute_864(char*, char *);
extern void execute_865(char*, char *);
extern void execute_866(char*, char *);
extern void execute_867(char*, char *);
extern void execute_868(char*, char *);
extern void execute_869(char*, char *);
extern void execute_870(char*, char *);
extern void execute_871(char*, char *);
extern void execute_872(char*, char *);
extern void execute_873(char*, char *);
extern void execute_874(char*, char *);
extern void execute_875(char*, char *);
extern void execute_876(char*, char *);
extern void execute_877(char*, char *);
extern void execute_878(char*, char *);
extern void execute_879(char*, char *);
extern void execute_880(char*, char *);
extern void execute_881(char*, char *);
extern void execute_882(char*, char *);
extern void execute_883(char*, char *);
extern void execute_884(char*, char *);
extern void execute_885(char*, char *);
extern void execute_886(char*, char *);
extern void execute_887(char*, char *);
extern void execute_888(char*, char *);
extern void execute_889(char*, char *);
extern void execute_890(char*, char *);
extern void execute_891(char*, char *);
extern void execute_892(char*, char *);
extern void execute_893(char*, char *);
extern void execute_894(char*, char *);
extern void execute_895(char*, char *);
extern void execute_896(char*, char *);
extern void execute_897(char*, char *);
extern void execute_898(char*, char *);
extern void execute_899(char*, char *);
extern void execute_900(char*, char *);
extern void execute_901(char*, char *);
extern void execute_902(char*, char *);
extern void execute_903(char*, char *);
extern void execute_904(char*, char *);
extern void execute_905(char*, char *);
extern void execute_906(char*, char *);
extern void execute_907(char*, char *);
extern void execute_908(char*, char *);
extern void execute_909(char*, char *);
extern void execute_910(char*, char *);
extern void execute_911(char*, char *);
extern void execute_912(char*, char *);
extern void execute_913(char*, char *);
extern void execute_914(char*, char *);
extern void execute_915(char*, char *);
extern void execute_916(char*, char *);
extern void execute_917(char*, char *);
extern void execute_918(char*, char *);
extern void execute_919(char*, char *);
extern void execute_920(char*, char *);
extern void execute_921(char*, char *);
extern void execute_922(char*, char *);
extern void execute_923(char*, char *);
extern void execute_924(char*, char *);
extern void execute_925(char*, char *);
extern void execute_926(char*, char *);
extern void execute_927(char*, char *);
extern void execute_928(char*, char *);
extern void execute_929(char*, char *);
extern void execute_930(char*, char *);
extern void execute_931(char*, char *);
extern void execute_932(char*, char *);
extern void execute_933(char*, char *);
extern void execute_934(char*, char *);
extern void execute_935(char*, char *);
extern void execute_936(char*, char *);
extern void execute_937(char*, char *);
extern void execute_938(char*, char *);
extern void execute_939(char*, char *);
extern void execute_940(char*, char *);
extern void execute_941(char*, char *);
extern void execute_942(char*, char *);
extern void execute_943(char*, char *);
extern void execute_944(char*, char *);
extern void execute_945(char*, char *);
extern void execute_946(char*, char *);
extern void execute_947(char*, char *);
extern void execute_948(char*, char *);
extern void execute_949(char*, char *);
extern void execute_950(char*, char *);
extern void execute_951(char*, char *);
extern void execute_952(char*, char *);
extern void execute_953(char*, char *);
extern void execute_954(char*, char *);
extern void execute_955(char*, char *);
extern void execute_956(char*, char *);
extern void execute_957(char*, char *);
extern void execute_958(char*, char *);
extern void execute_959(char*, char *);
extern void execute_960(char*, char *);
extern void execute_1490(char*, char *);
extern void execute_1491(char*, char *);
extern void execute_1535(char*, char *);
extern void execute_1728(char*, char *);
extern void execute_1495(char*, char *);
extern void execute_1498(char*, char *);
extern void execute_1743(char*, char *);
extern void execute_1744(char*, char *);
extern void execute_1745(char*, char *);
extern void execute_1746(char*, char *);
extern void execute_1747(char*, char *);
extern void execute_1748(char*, char *);
extern void execute_1757(char*, char *);
extern void execute_1950(char*, char *);
extern void execute_1737(char*, char *);
extern void execute_1740(char*, char *);
extern void execute_1751(char*, char *);
extern void execute_1754(char*, char *);
extern void execute_1760(char*, char *);
extern void execute_1762(char*, char *);
extern void execute_1789(char*, char *);
extern void execute_1790(char*, char *);
extern void execute_1791(char*, char *);
extern void execute_1792(char*, char *);
extern void execute_1793(char*, char *);
extern void execute_1794(char*, char *);
extern void execute_1795(char*, char *);
extern void execute_1796(char*, char *);
extern void execute_1797(char*, char *);
extern void execute_1798(char*, char *);
extern void execute_1799(char*, char *);
extern void execute_1800(char*, char *);
extern void execute_1801(char*, char *);
extern void execute_1802(char*, char *);
extern void execute_1803(char*, char *);
extern void execute_1804(char*, char *);
extern void execute_1805(char*, char *);
extern void execute_1943(char*, char *);
extern void execute_1944(char*, char *);
extern void execute_1948(char*, char *);
extern void execute_1765(char*, char *);
extern void execute_1768(char*, char *);
extern void execute_1781(char*, char *);
extern void execute_1784(char*, char *);
extern void execute_1811(char*, char *);
extern void execute_1812(char*, char *);
extern void execute_1813(char*, char *);
extern void execute_1814(char*, char *);
extern void execute_1815(char*, char *);
extern void execute_1816(char*, char *);
extern void execute_1817(char*, char *);
extern void execute_1818(char*, char *);
extern void execute_1819(char*, char *);
extern void execute_1820(char*, char *);
extern void execute_1821(char*, char *);
extern void execute_1822(char*, char *);
extern void execute_1823(char*, char *);
extern void execute_1824(char*, char *);
extern void execute_1825(char*, char *);
extern void execute_1826(char*, char *);
extern void execute_1827(char*, char *);
extern void execute_1828(char*, char *);
extern void execute_1829(char*, char *);
extern void execute_1830(char*, char *);
extern void execute_1831(char*, char *);
extern void execute_1832(char*, char *);
extern void execute_1833(char*, char *);
extern void execute_1834(char*, char *);
extern void execute_1835(char*, char *);
extern void execute_1836(char*, char *);
extern void execute_1837(char*, char *);
extern void execute_1838(char*, char *);
extern void execute_1839(char*, char *);
extern void execute_1840(char*, char *);
extern void execute_1841(char*, char *);
extern void execute_1842(char*, char *);
extern void execute_1843(char*, char *);
extern void execute_1844(char*, char *);
extern void execute_1845(char*, char *);
extern void execute_1846(char*, char *);
extern void execute_1847(char*, char *);
extern void execute_1848(char*, char *);
extern void execute_1849(char*, char *);
extern void execute_1850(char*, char *);
extern void execute_1851(char*, char *);
extern void execute_1852(char*, char *);
extern void execute_1853(char*, char *);
extern void execute_1854(char*, char *);
extern void execute_1855(char*, char *);
extern void execute_1856(char*, char *);
extern void execute_1857(char*, char *);
extern void execute_1858(char*, char *);
extern void execute_1859(char*, char *);
extern void execute_1860(char*, char *);
extern void execute_1861(char*, char *);
extern void execute_1862(char*, char *);
extern void execute_1863(char*, char *);
extern void execute_1864(char*, char *);
extern void execute_1865(char*, char *);
extern void execute_1866(char*, char *);
extern void execute_1867(char*, char *);
extern void execute_1868(char*, char *);
extern void execute_1869(char*, char *);
extern void execute_1870(char*, char *);
extern void execute_1871(char*, char *);
extern void execute_1872(char*, char *);
extern void execute_1873(char*, char *);
extern void execute_1874(char*, char *);
extern void execute_1875(char*, char *);
extern void execute_1876(char*, char *);
extern void execute_1877(char*, char *);
extern void execute_1878(char*, char *);
extern void execute_1879(char*, char *);
extern void execute_1880(char*, char *);
extern void execute_1881(char*, char *);
extern void execute_1882(char*, char *);
extern void execute_1883(char*, char *);
extern void execute_1884(char*, char *);
extern void execute_1885(char*, char *);
extern void execute_1886(char*, char *);
extern void execute_1887(char*, char *);
extern void execute_1888(char*, char *);
extern void execute_1889(char*, char *);
extern void execute_1890(char*, char *);
extern void execute_1891(char*, char *);
extern void execute_1892(char*, char *);
extern void execute_1893(char*, char *);
extern void execute_1894(char*, char *);
extern void execute_1895(char*, char *);
extern void execute_1896(char*, char *);
extern void execute_1897(char*, char *);
extern void execute_1898(char*, char *);
extern void execute_1899(char*, char *);
extern void execute_1900(char*, char *);
extern void execute_1901(char*, char *);
extern void execute_1902(char*, char *);
extern void execute_1903(char*, char *);
extern void execute_1904(char*, char *);
extern void execute_1905(char*, char *);
extern void execute_1906(char*, char *);
extern void execute_1907(char*, char *);
extern void execute_1908(char*, char *);
extern void execute_1909(char*, char *);
extern void execute_1910(char*, char *);
extern void execute_1911(char*, char *);
extern void execute_1912(char*, char *);
extern void execute_1913(char*, char *);
extern void execute_1914(char*, char *);
extern void execute_1915(char*, char *);
extern void execute_1916(char*, char *);
extern void execute_1917(char*, char *);
extern void execute_1918(char*, char *);
extern void execute_1919(char*, char *);
extern void execute_1920(char*, char *);
extern void execute_1921(char*, char *);
extern void execute_1922(char*, char *);
extern void execute_1923(char*, char *);
extern void execute_1924(char*, char *);
extern void execute_1925(char*, char *);
extern void execute_1926(char*, char *);
extern void execute_1927(char*, char *);
extern void execute_1928(char*, char *);
extern void execute_1929(char*, char *);
extern void execute_1930(char*, char *);
extern void execute_1931(char*, char *);
extern void execute_1932(char*, char *);
extern void execute_1933(char*, char *);
extern void execute_1934(char*, char *);
extern void execute_1935(char*, char *);
extern void execute_1936(char*, char *);
extern void execute_1937(char*, char *);
extern void execute_1938(char*, char *);
extern void execute_1939(char*, char *);
extern void execute_1940(char*, char *);
extern void execute_2187(char*, char *);
extern void execute_2188(char*, char *);
extern void execute_2226(char*, char *);
extern void execute_2419(char*, char *);
extern void execute_2191(char*, char *);
extern void execute_2201(char*, char *);
extern void execute_2229(char*, char *);
extern void execute_2231(char*, char *);
extern void execute_2258(char*, char *);
extern void execute_2259(char*, char *);
extern void execute_2260(char*, char *);
extern void execute_2261(char*, char *);
extern void execute_2262(char*, char *);
extern void execute_2263(char*, char *);
extern void execute_2264(char*, char *);
extern void execute_2265(char*, char *);
extern void execute_2266(char*, char *);
extern void execute_2267(char*, char *);
extern void execute_2268(char*, char *);
extern void execute_2269(char*, char *);
extern void execute_2270(char*, char *);
extern void execute_2271(char*, char *);
extern void execute_2272(char*, char *);
extern void execute_2273(char*, char *);
extern void execute_2274(char*, char *);
extern void execute_2412(char*, char *);
extern void execute_2413(char*, char *);
extern void execute_2415(char*, char *);
extern void execute_2930(char*, char *);
extern void execute_2931(char*, char *);
extern void execute_2975(char*, char *);
extern void execute_3168(char*, char *);
extern void execute_3406(char*, char *);
extern void execute_3408(char*, char *);
extern void execute_3409(char*, char *);
extern void execute_3420(char*, char *);
extern void execute_3422(char*, char *);
extern void execute_3423(char*, char *);
extern void execute_3481(char*, char *);
extern void execute_3483(char*, char *);
extern void execute_3484(char*, char *);
extern void execute_3490(char*, char *);
extern void execute_3491(char*, char *);
extern void execute_3492(char*, char *);
extern void execute_3502(char*, char *);
extern void execute_3504(char*, char *);
extern void execute_3505(char*, char *);
extern void execute_3538(char*, char *);
extern void execute_3539(char*, char *);
extern void execute_3535(char*, char *);
extern void execute_3536(char*, char *);
extern void execute_3545(char*, char *);
extern void execute_3546(char*, char *);
extern void execute_3547(char*, char *);
extern void execute_3584(char*, char *);
extern void execute_3585(char*, char *);
extern void execute_3586(char*, char *);
extern void execute_3594(char*, char *);
extern void execute_3595(char*, char *);
extern void execute_3596(char*, char *);
extern void execute_3597(char*, char *);
extern void execute_3598(char*, char *);
extern void transaction_5(char*, char*, unsigned, unsigned, unsigned);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_8(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_11(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_14(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_15(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_16(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_17(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_64(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_69(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_76(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_78(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_80(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_94(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_109(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_111(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_112(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_113(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_115(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_119(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_160(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_161(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_162(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_167(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_178(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_196(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_437(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_438(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_447(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_448(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_597(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_735(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_736(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_745(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_746(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_895(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1033(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1034(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1043(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1044(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1193(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1331(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1332(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1341(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1342(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1495(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1776(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2009(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2010(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2019(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2020(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2169(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2307(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2308(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2317(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2318(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2467(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2605(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2606(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2615(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2616(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2765(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2903(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2904(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2913(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2914(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3067(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3348(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3488(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[687] = {(funcp)execute_3579, (funcp)execute_3580, (funcp)execute_3581, (funcp)execute_3582, (funcp)execute_3590, (funcp)execute_3591, (funcp)execute_3592, (funcp)execute_3593, (funcp)execute_3587, (funcp)execute_3588, (funcp)execute_3589, (funcp)execute_165, (funcp)execute_166, (funcp)execute_167, (funcp)execute_3554, (funcp)execute_3555, (funcp)execute_3556, (funcp)execute_3557, (funcp)execute_3569, (funcp)execute_3570, (funcp)execute_3571, (funcp)execute_3572, (funcp)execute_3573, (funcp)execute_3574, (funcp)execute_170, (funcp)execute_172, (funcp)execute_175, (funcp)execute_176, (funcp)execute_180, (funcp)execute_179, (funcp)execute_184, (funcp)execute_202, (funcp)execute_254, (funcp)execute_264, (funcp)execute_211, (funcp)execute_294, (funcp)execute_295, (funcp)execute_296, (funcp)execute_301, (funcp)execute_302, (funcp)execute_303, (funcp)execute_304, (funcp)execute_305, (funcp)execute_306, (funcp)execute_326, (funcp)execute_327, (funcp)execute_328, (funcp)execute_332, (funcp)execute_353, (funcp)execute_354, (funcp)execute_355, (funcp)execute_359, (funcp)execute_380, (funcp)execute_381, (funcp)execute_382, (funcp)execute_386, (funcp)execute_390, (funcp)execute_1954, (funcp)execute_1955, (funcp)execute_392, (funcp)execute_393, (funcp)execute_433, (funcp)execute_472, (funcp)execute_477, (funcp)execute_478, (funcp)execute_586, (funcp)execute_589, (funcp)execute_613, (funcp)execute_637, (funcp)execute_661, (funcp)execute_687, (funcp)execute_688, (funcp)execute_689, (funcp)execute_691, (funcp)execute_696, (funcp)execute_972, (funcp)execute_973, (funcp)execute_976, (funcp)execute_977, (funcp)execute_978, (funcp)execute_980, (funcp)execute_985, (funcp)execute_1226, (funcp)execute_1227, (funcp)execute_1228, (funcp)execute_1230, (funcp)execute_1235, (funcp)execute_1476, (funcp)execute_1477, (funcp)execute_1478, (funcp)execute_1482, (funcp)execute_1485, (funcp)execute_1732, (funcp)execute_1733, (funcp)execute_1951, (funcp)execute_1957, (funcp)execute_3394, (funcp)execute_3395, (funcp)execute_1959, (funcp)execute_1960, (funcp)execute_1966, (funcp)execute_1967, (funcp)execute_2075, (funcp)execute_2078, (funcp)execute_2102, (funcp)execute_2126, (funcp)execute_2150, (funcp)execute_2177, (funcp)execute_2182, (funcp)execute_2421, (funcp)execute_2422, (funcp)execute_2426, (funcp)execute_2431, (funcp)execute_2673, (funcp)execute_2678, (funcp)execute_2922, (funcp)execute_2925, (funcp)execute_3172, (funcp)execute_3173, (funcp)execute_3391, (funcp)execute_3468, (funcp)execute_3508, (funcp)execute_3509, (funcp)execute_3471, (funcp)execute_3472, (funcp)execute_3517, (funcp)execute_3518, (funcp)execute_3522, (funcp)execute_3523, (funcp)execute_3527, (funcp)execute_3528, (funcp)execute_3530, (funcp)execute_3540, (funcp)execute_3551, (funcp)execute_3559, (funcp)execute_3560, (funcp)execute_3561, (funcp)execute_3562, (funcp)execute_3563, (funcp)execute_3564, (funcp)execute_3567, (funcp)execute_196, (funcp)execute_198, (funcp)execute_199, (funcp)execute_206, (funcp)execute_207, (funcp)execute_208, (funcp)execute_224, (funcp)execute_225, (funcp)execute_226, (funcp)execute_241, (funcp)execute_242, (funcp)execute_243, (funcp)execute_280, (funcp)execute_281, (funcp)execute_287, (funcp)execute_290, (funcp)execute_397, (funcp)execute_398, (funcp)execute_399, (funcp)execute_400, (funcp)execute_404, (funcp)execute_405, (funcp)execute_406, (funcp)execute_403, (funcp)execute_409, (funcp)execute_420, (funcp)execute_418, (funcp)execute_416, (funcp)execute_432, (funcp)execute_430, (funcp)execute_428, (funcp)execute_436, (funcp)execute_437, (funcp)execute_438, (funcp)execute_439, (funcp)execute_443, (funcp)execute_444, (funcp)execute_445, (funcp)execute_442, (funcp)execute_448, (funcp)execute_459, (funcp)execute_457, (funcp)execute_455, (funcp)execute_471, (funcp)execute_469, (funcp)execute_467, (funcp)execute_482, (funcp)execute_493, (funcp)execute_487, (funcp)execute_488, (funcp)execute_489, (funcp)execute_503, (funcp)execute_505, (funcp)execute_506, (funcp)execute_532, (funcp)execute_534, (funcp)execute_535, (funcp)execute_577, (funcp)execute_580, (funcp)execute_592, (funcp)execute_595, (funcp)execute_607, (funcp)execute_608, (funcp)execute_598, (funcp)execute_600, (funcp)execute_605, (funcp)execute_610, (funcp)execute_664, (funcp)execute_667, (funcp)execute_679, (funcp)execute_680, (funcp)execute_670, (funcp)execute_673, (funcp)execute_677, (funcp)execute_682, (funcp)execute_701, (funcp)execute_702, (funcp)execute_740, (funcp)execute_970, (funcp)execute_705, (funcp)execute_715, (funcp)execute_734, (funcp)execute_737, (funcp)execute_743, (funcp)execute_745, (funcp)execute_772, (funcp)execute_773, (funcp)execute_774, (funcp)execute_775, (funcp)execute_776, (funcp)execute_777, (funcp)execute_778, (funcp)execute_779, (funcp)execute_780, (funcp)execute_781, (funcp)execute_782, (funcp)execute_783, (funcp)execute_784, (funcp)execute_785, (funcp)execute_786, (funcp)execute_787, (funcp)execute_788, (funcp)execute_963, (funcp)execute_964, (funcp)execute_966, (funcp)execute_831, (funcp)execute_832, (funcp)execute_833, (funcp)execute_834, (funcp)execute_835, (funcp)execute_836, (funcp)execute_837, (funcp)execute_838, (funcp)execute_839, (funcp)execute_840, (funcp)execute_841, (funcp)execute_842, (funcp)execute_843, (funcp)execute_844, (funcp)execute_845, (funcp)execute_846, (funcp)execute_847, (funcp)execute_848, (funcp)execute_849, (funcp)execute_850, (funcp)execute_851, (funcp)execute_852, (funcp)execute_853, (funcp)execute_854, (funcp)execute_855, (funcp)execute_856, (funcp)execute_857, (funcp)execute_858, (funcp)execute_859, (funcp)execute_860, (funcp)execute_861, (funcp)execute_862, (funcp)execute_863, (funcp)execute_864, (funcp)execute_865, (funcp)execute_866, (funcp)execute_867, (funcp)execute_868, (funcp)execute_869, (funcp)execute_870, (funcp)execute_871, (funcp)execute_872, (funcp)execute_873, (funcp)execute_874, (funcp)execute_875, (funcp)execute_876, (funcp)execute_877, (funcp)execute_878, (funcp)execute_879, (funcp)execute_880, (funcp)execute_881, (funcp)execute_882, (funcp)execute_883, (funcp)execute_884, (funcp)execute_885, (funcp)execute_886, (funcp)execute_887, (funcp)execute_888, (funcp)execute_889, (funcp)execute_890, (funcp)execute_891, (funcp)execute_892, (funcp)execute_893, (funcp)execute_894, (funcp)execute_895, (funcp)execute_896, (funcp)execute_897, (funcp)execute_898, (funcp)execute_899, (funcp)execute_900, (funcp)execute_901, (funcp)execute_902, (funcp)execute_903, (funcp)execute_904, (funcp)execute_905, (funcp)execute_906, (funcp)execute_907, (funcp)execute_908, (funcp)execute_909, (funcp)execute_910, (funcp)execute_911, (funcp)execute_912, (funcp)execute_913, (funcp)execute_914, (funcp)execute_915, (funcp)execute_916, (funcp)execute_917, (funcp)execute_918, (funcp)execute_919, (funcp)execute_920, (funcp)execute_921, (funcp)execute_922, (funcp)execute_923, (funcp)execute_924, (funcp)execute_925, (funcp)execute_926, (funcp)execute_927, (funcp)execute_928, (funcp)execute_929, (funcp)execute_930, (funcp)execute_931, (funcp)execute_932, (funcp)execute_933, (funcp)execute_934, (funcp)execute_935, (funcp)execute_936, (funcp)execute_937, (funcp)execute_938, (funcp)execute_939, (funcp)execute_940, (funcp)execute_941, (funcp)execute_942, (funcp)execute_943, (funcp)execute_944, (funcp)execute_945, (funcp)execute_946, (funcp)execute_947, (funcp)execute_948, (funcp)execute_949, (funcp)execute_950, (funcp)execute_951, (funcp)execute_952, (funcp)execute_953, (funcp)execute_954, (funcp)execute_955, (funcp)execute_956, (funcp)execute_957, (funcp)execute_958, (funcp)execute_959, (funcp)execute_960, (funcp)execute_1490, (funcp)execute_1491, (funcp)execute_1535, (funcp)execute_1728, (funcp)execute_1495, (funcp)execute_1498, (funcp)execute_1743, (funcp)execute_1744, (funcp)execute_1745, (funcp)execute_1746, (funcp)execute_1747, (funcp)execute_1748, (funcp)execute_1757, (funcp)execute_1950, (funcp)execute_1737, (funcp)execute_1740, (funcp)execute_1751, (funcp)execute_1754, (funcp)execute_1760, (funcp)execute_1762, (funcp)execute_1789, (funcp)execute_1790, (funcp)execute_1791, (funcp)execute_1792, (funcp)execute_1793, (funcp)execute_1794, (funcp)execute_1795, (funcp)execute_1796, (funcp)execute_1797, (funcp)execute_1798, (funcp)execute_1799, (funcp)execute_1800, (funcp)execute_1801, (funcp)execute_1802, (funcp)execute_1803, (funcp)execute_1804, (funcp)execute_1805, (funcp)execute_1943, (funcp)execute_1944, (funcp)execute_1948, (funcp)execute_1765, (funcp)execute_1768, (funcp)execute_1781, (funcp)execute_1784, (funcp)execute_1811, (funcp)execute_1812, (funcp)execute_1813, (funcp)execute_1814, (funcp)execute_1815, (funcp)execute_1816, (funcp)execute_1817, (funcp)execute_1818, (funcp)execute_1819, (funcp)execute_1820, (funcp)execute_1821, (funcp)execute_1822, (funcp)execute_1823, (funcp)execute_1824, (funcp)execute_1825, (funcp)execute_1826, (funcp)execute_1827, (funcp)execute_1828, (funcp)execute_1829, (funcp)execute_1830, (funcp)execute_1831, (funcp)execute_1832, (funcp)execute_1833, (funcp)execute_1834, (funcp)execute_1835, (funcp)execute_1836, (funcp)execute_1837, (funcp)execute_1838, (funcp)execute_1839, (funcp)execute_1840, (funcp)execute_1841, (funcp)execute_1842, (funcp)execute_1843, (funcp)execute_1844, (funcp)execute_1845, (funcp)execute_1846, (funcp)execute_1847, (funcp)execute_1848, (funcp)execute_1849, (funcp)execute_1850, (funcp)execute_1851, (funcp)execute_1852, (funcp)execute_1853, (funcp)execute_1854, (funcp)execute_1855, (funcp)execute_1856, (funcp)execute_1857, (funcp)execute_1858, (funcp)execute_1859, (funcp)execute_1860, (funcp)execute_1861, (funcp)execute_1862, (funcp)execute_1863, (funcp)execute_1864, (funcp)execute_1865, (funcp)execute_1866, (funcp)execute_1867, (funcp)execute_1868, (funcp)execute_1869, (funcp)execute_1870, (funcp)execute_1871, (funcp)execute_1872, (funcp)execute_1873, (funcp)execute_1874, (funcp)execute_1875, (funcp)execute_1876, (funcp)execute_1877, (funcp)execute_1878, (funcp)execute_1879, (funcp)execute_1880, (funcp)execute_1881, (funcp)execute_1882, (funcp)execute_1883, (funcp)execute_1884, (funcp)execute_1885, (funcp)execute_1886, (funcp)execute_1887, (funcp)execute_1888, (funcp)execute_1889, (funcp)execute_1890, (funcp)execute_1891, (funcp)execute_1892, (funcp)execute_1893, (funcp)execute_1894, (funcp)execute_1895, (funcp)execute_1896, (funcp)execute_1897, (funcp)execute_1898, (funcp)execute_1899, (funcp)execute_1900, (funcp)execute_1901, (funcp)execute_1902, (funcp)execute_1903, (funcp)execute_1904, (funcp)execute_1905, (funcp)execute_1906, (funcp)execute_1907, (funcp)execute_1908, (funcp)execute_1909, (funcp)execute_1910, (funcp)execute_1911, (funcp)execute_1912, (funcp)execute_1913, (funcp)execute_1914, (funcp)execute_1915, (funcp)execute_1916, (funcp)execute_1917, (funcp)execute_1918, (funcp)execute_1919, (funcp)execute_1920, (funcp)execute_1921, (funcp)execute_1922, (funcp)execute_1923, (funcp)execute_1924, (funcp)execute_1925, (funcp)execute_1926, (funcp)execute_1927, (funcp)execute_1928, (funcp)execute_1929, (funcp)execute_1930, (funcp)execute_1931, (funcp)execute_1932, (funcp)execute_1933, (funcp)execute_1934, (funcp)execute_1935, (funcp)execute_1936, (funcp)execute_1937, (funcp)execute_1938, (funcp)execute_1939, (funcp)execute_1940, (funcp)execute_2187, (funcp)execute_2188, (funcp)execute_2226, (funcp)execute_2419, (funcp)execute_2191, (funcp)execute_2201, (funcp)execute_2229, (funcp)execute_2231, (funcp)execute_2258, (funcp)execute_2259, (funcp)execute_2260, (funcp)execute_2261, (funcp)execute_2262, (funcp)execute_2263, (funcp)execute_2264, (funcp)execute_2265, (funcp)execute_2266, (funcp)execute_2267, (funcp)execute_2268, (funcp)execute_2269, (funcp)execute_2270, (funcp)execute_2271, (funcp)execute_2272, (funcp)execute_2273, (funcp)execute_2274, (funcp)execute_2412, (funcp)execute_2413, (funcp)execute_2415, (funcp)execute_2930, (funcp)execute_2931, (funcp)execute_2975, (funcp)execute_3168, (funcp)execute_3406, (funcp)execute_3408, (funcp)execute_3409, (funcp)execute_3420, (funcp)execute_3422, (funcp)execute_3423, (funcp)execute_3481, (funcp)execute_3483, (funcp)execute_3484, (funcp)execute_3490, (funcp)execute_3491, (funcp)execute_3492, (funcp)execute_3502, (funcp)execute_3504, (funcp)execute_3505, (funcp)execute_3538, (funcp)execute_3539, (funcp)execute_3535, (funcp)execute_3536, (funcp)execute_3545, (funcp)execute_3546, (funcp)execute_3547, (funcp)execute_3584, (funcp)execute_3585, (funcp)execute_3586, (funcp)execute_3594, (funcp)execute_3595, (funcp)execute_3596, (funcp)execute_3597, (funcp)execute_3598, (funcp)transaction_5, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_8, (funcp)transaction_11, (funcp)transaction_14, (funcp)transaction_15, (funcp)transaction_16, (funcp)transaction_17, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_59, (funcp)transaction_62, (funcp)transaction_64, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_69, (funcp)transaction_72, (funcp)transaction_76, (funcp)transaction_78, (funcp)transaction_80, (funcp)transaction_94, (funcp)transaction_109, (funcp)transaction_111, (funcp)transaction_112, (funcp)transaction_113, (funcp)transaction_115, (funcp)transaction_119, (funcp)transaction_160, (funcp)transaction_161, (funcp)transaction_162, (funcp)transaction_167, (funcp)transaction_178, (funcp)transaction_196, (funcp)transaction_437, (funcp)transaction_438, (funcp)transaction_447, (funcp)transaction_448, (funcp)transaction_597, (funcp)transaction_735, (funcp)transaction_736, (funcp)transaction_745, (funcp)transaction_746, (funcp)transaction_895, (funcp)transaction_1033, (funcp)transaction_1034, (funcp)transaction_1043, (funcp)transaction_1044, (funcp)transaction_1193, (funcp)transaction_1331, (funcp)transaction_1332, (funcp)transaction_1341, (funcp)transaction_1342, (funcp)transaction_1495, (funcp)transaction_1776, (funcp)transaction_2009, (funcp)transaction_2010, (funcp)transaction_2019, (funcp)transaction_2020, (funcp)transaction_2169, (funcp)transaction_2307, (funcp)transaction_2308, (funcp)transaction_2317, (funcp)transaction_2318, (funcp)transaction_2467, (funcp)transaction_2605, (funcp)transaction_2606, (funcp)transaction_2615, (funcp)transaction_2616, (funcp)transaction_2765, (funcp)transaction_2903, (funcp)transaction_2904, (funcp)transaction_2913, (funcp)transaction_2914, (funcp)transaction_3067, (funcp)transaction_3348, (funcp)transaction_3488};
const int NumRelocateId= 687;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/srrc_filter_tb_behav/xsim.reloc",  (void **)funcTab, 687);
	iki_vhdl_file_variable_register(dp + 808648);
	iki_vhdl_file_variable_register(dp + 808704);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/srrc_filter_tb_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 824960, dp + 821112, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 825056, dp + 821280, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 825112, dp + 824200, 0, 47, 0, 47, 48, 1);

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/srrc_filter_tb_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/srrc_filter_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/srrc_filter_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/srrc_filter_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
