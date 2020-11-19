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
extern void execute_772(char*, char *);
extern void execute_773(char*, char *);
extern void execute_774(char*, char *);
extern void execute_781(char*, char *);
extern void execute_782(char*, char *);
extern void execute_783(char*, char *);
extern void execute_784(char*, char *);
extern void execute_785(char*, char *);
extern void execute_786(char*, char *);
extern void execute_779(char*, char *);
extern void execute_780(char*, char *);
extern void execute_131(char*, char *);
extern void execute_197(char*, char *);
extern void execute_740(char*, char *);
extern void execute_741(char*, char *);
extern void execute_749(char*, char *);
extern void execute_757(char*, char *);
extern void execute_758(char*, char *);
extern void execute_202(char*, char *);
extern void execute_204(char*, char *);
extern void execute_229(char*, char *);
extern void execute_207(char*, char *);
extern void execute_208(char*, char *);
extern void execute_232(char*, char *);
extern void execute_236(char*, char *);
extern void execute_246(char*, char *);
extern void execute_242(char*, char *);
extern void execute_243(char*, char *);
extern void execute_747(char*, char *);
extern void execute_744(char*, char *);
extern void execute_745(char*, char *);
extern void execute_753(char*, char *);
extern void execute_754(char*, char *);
extern void execute_755(char*, char *);
extern void execute_149(char*, char *);
extern void execute_150(char*, char *);
extern void execute_164(char*, char *);
extern void execute_140(char*, char *);
extern void execute_146(char*, char *);
extern void execute_147(char*, char *);
extern void execute_144(char*, char *);
extern void execute_152(char*, char *);
extern void execute_154(char*, char *);
extern void execute_156(char*, char *);
extern void execute_158(char*, char *);
extern void execute_160(char*, char *);
extern void execute_162(char*, char *);
extern void execute_225(char*, char *);
extern void execute_226(char*, char *);
extern void execute_228(char*, char *);
extern void execute_217(char*, char *);
extern void execute_222(char*, char *);
extern void execute_223(char*, char *);
extern void execute_220(char*, char *);
extern void execute_255(char*, char *);
extern void execute_733(char*, char *);
extern void execute_734(char*, char *);
extern void execute_259(char*, char *);
extern void execute_261(char*, char *);
extern void execute_301(char*, char *);
extern void execute_303(char*, char *);
extern void execute_304(char*, char *);
extern void execute_378(char*, char *);
extern void execute_387(char*, char *);
extern void execute_394(char*, char *);
extern void execute_406(char*, char *);
extern void execute_703(char*, char *);
extern void execute_704(char*, char *);
extern void execute_719(char*, char *);
extern void execute_702(char*, char *);
extern void execute_707(char*, char *);
extern void execute_708(char*, char *);
extern void execute_267(char*, char *);
extern void execute_268(char*, char *);
extern void execute_269(char*, char *);
extern void execute_275(char*, char *);
extern void execute_293(char*, char *);
extern void execute_294(char*, char *);
extern void execute_296(char*, char *);
extern void execute_284(char*, char *);
extern void execute_290(char*, char *);
extern void execute_291(char*, char *);
extern void execute_288(char*, char *);
extern void execute_325(char*, char *);
extern void execute_316(char*, char *);
extern void execute_317(char*, char *);
extern void execute_321(char*, char *);
extern void execute_328(char*, char *);
extern void execute_361(char*, char *);
extern void execute_363(char*, char *);
extern void execute_364(char*, char *);
extern void execute_332(char*, char *);
extern void execute_337(char*, char *);
extern void execute_355(char*, char *);
extern void execute_356(char*, char *);
extern void execute_358(char*, char *);
extern void execute_346(char*, char *);
extern void execute_352(char*, char *);
extern void execute_353(char*, char *);
extern void execute_350(char*, char *);
extern void execute_368(char*, char *);
extern void execute_369(char*, char *);
extern void execute_370(char*, char *);
extern void execute_383(char*, char *);
extern void execute_712(char*, char *);
extern void execute_419(char*, char *);
extern void execute_422(char*, char *);
extern void execute_429(char*, char *);
extern void execute_470(char*, char *);
extern void execute_471(char*, char *);
extern void execute_432(char*, char *);
extern void execute_436(char*, char *);
extern void execute_439(char*, char *);
extern void execute_443(char*, char *);
extern void execute_475(char*, char *);
extern void execute_476(char*, char *);
extern void execute_480(char*, char *);
extern void execute_522(char*, char *);
extern void execute_523(char*, char *);
extern void execute_527(char*, char *);
extern void execute_528(char*, char *);
extern void execute_529(char*, char *);
extern void execute_530(char*, char *);
extern void execute_531(char*, char *);
extern void execute_532(char*, char *);
extern void execute_533(char*, char *);
extern void execute_534(char*, char *);
extern void execute_615(char*, char *);
extern void execute_616(char*, char *);
extern void execute_617(char*, char *);
extern void execute_618(char*, char *);
extern void execute_460(char*, char *);
extern void execute_461(char*, char *);
extern void execute_469(char*, char *);
extern void execute_451(char*, char *);
extern void execute_457(char*, char *);
extern void execute_458(char*, char *);
extern void execute_455(char*, char *);
extern void execute_463(char*, char *);
extern void execute_465(char*, char *);
extern void execute_467(char*, char *);
extern void execute_497(char*, char *);
extern void execute_498(char*, char *);
extern void execute_500(char*, char *);
extern void execute_488(char*, char *);
extern void execute_494(char*, char *);
extern void execute_495(char*, char *);
extern void execute_492(char*, char *);
extern void execute_551(char*, char *);
extern void execute_552(char*, char *);
extern void execute_554(char*, char *);
extern void execute_542(char*, char *);
extern void execute_548(char*, char *);
extern void execute_549(char*, char *);
extern void execute_546(char*, char *);
extern void execute_571(char*, char *);
extern void execute_572(char*, char *);
extern void execute_574(char*, char *);
extern void execute_562(char*, char *);
extern void execute_568(char*, char *);
extern void execute_569(char*, char *);
extern void execute_566(char*, char *);
extern void execute_725(char*, char *);
extern void execute_776(char*, char *);
extern void execute_777(char*, char *);
extern void execute_778(char*, char *);
extern void execute_787(char*, char *);
extern void execute_788(char*, char *);
extern void execute_789(char*, char *);
extern void execute_790(char*, char *);
extern void execute_791(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_9(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_10(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_11(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_15(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_16(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_19(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_61(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_62(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_65(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_72(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_73(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_76(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_77(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_78(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_85(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_99(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_103(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_110(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_119(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_245(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_262(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_263(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[196] = {(funcp)execute_772, (funcp)execute_773, (funcp)execute_774, (funcp)execute_781, (funcp)execute_782, (funcp)execute_783, (funcp)execute_784, (funcp)execute_785, (funcp)execute_786, (funcp)execute_779, (funcp)execute_780, (funcp)execute_131, (funcp)execute_197, (funcp)execute_740, (funcp)execute_741, (funcp)execute_749, (funcp)execute_757, (funcp)execute_758, (funcp)execute_202, (funcp)execute_204, (funcp)execute_229, (funcp)execute_207, (funcp)execute_208, (funcp)execute_232, (funcp)execute_236, (funcp)execute_246, (funcp)execute_242, (funcp)execute_243, (funcp)execute_747, (funcp)execute_744, (funcp)execute_745, (funcp)execute_753, (funcp)execute_754, (funcp)execute_755, (funcp)execute_149, (funcp)execute_150, (funcp)execute_164, (funcp)execute_140, (funcp)execute_146, (funcp)execute_147, (funcp)execute_144, (funcp)execute_152, (funcp)execute_154, (funcp)execute_156, (funcp)execute_158, (funcp)execute_160, (funcp)execute_162, (funcp)execute_225, (funcp)execute_226, (funcp)execute_228, (funcp)execute_217, (funcp)execute_222, (funcp)execute_223, (funcp)execute_220, (funcp)execute_255, (funcp)execute_733, (funcp)execute_734, (funcp)execute_259, (funcp)execute_261, (funcp)execute_301, (funcp)execute_303, (funcp)execute_304, (funcp)execute_378, (funcp)execute_387, (funcp)execute_394, (funcp)execute_406, (funcp)execute_703, (funcp)execute_704, (funcp)execute_719, (funcp)execute_702, (funcp)execute_707, (funcp)execute_708, (funcp)execute_267, (funcp)execute_268, (funcp)execute_269, (funcp)execute_275, (funcp)execute_293, (funcp)execute_294, (funcp)execute_296, (funcp)execute_284, (funcp)execute_290, (funcp)execute_291, (funcp)execute_288, (funcp)execute_325, (funcp)execute_316, (funcp)execute_317, (funcp)execute_321, (funcp)execute_328, (funcp)execute_361, (funcp)execute_363, (funcp)execute_364, (funcp)execute_332, (funcp)execute_337, (funcp)execute_355, (funcp)execute_356, (funcp)execute_358, (funcp)execute_346, (funcp)execute_352, (funcp)execute_353, (funcp)execute_350, (funcp)execute_368, (funcp)execute_369, (funcp)execute_370, (funcp)execute_383, (funcp)execute_712, (funcp)execute_419, (funcp)execute_422, (funcp)execute_429, (funcp)execute_470, (funcp)execute_471, (funcp)execute_432, (funcp)execute_436, (funcp)execute_439, (funcp)execute_443, (funcp)execute_475, (funcp)execute_476, (funcp)execute_480, (funcp)execute_522, (funcp)execute_523, (funcp)execute_527, (funcp)execute_528, (funcp)execute_529, (funcp)execute_530, (funcp)execute_531, (funcp)execute_532, (funcp)execute_533, (funcp)execute_534, (funcp)execute_615, (funcp)execute_616, (funcp)execute_617, (funcp)execute_618, (funcp)execute_460, (funcp)execute_461, (funcp)execute_469, (funcp)execute_451, (funcp)execute_457, (funcp)execute_458, (funcp)execute_455, (funcp)execute_463, (funcp)execute_465, (funcp)execute_467, (funcp)execute_497, (funcp)execute_498, (funcp)execute_500, (funcp)execute_488, (funcp)execute_494, (funcp)execute_495, (funcp)execute_492, (funcp)execute_551, (funcp)execute_552, (funcp)execute_554, (funcp)execute_542, (funcp)execute_548, (funcp)execute_549, (funcp)execute_546, (funcp)execute_571, (funcp)execute_572, (funcp)execute_574, (funcp)execute_562, (funcp)execute_568, (funcp)execute_569, (funcp)execute_566, (funcp)execute_725, (funcp)execute_776, (funcp)execute_777, (funcp)execute_778, (funcp)execute_787, (funcp)execute_788, (funcp)execute_789, (funcp)execute_790, (funcp)execute_791, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_9, (funcp)transaction_10, (funcp)transaction_11, (funcp)transaction_15, (funcp)transaction_16, (funcp)transaction_19, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_61, (funcp)transaction_62, (funcp)transaction_65, (funcp)transaction_66, (funcp)transaction_72, (funcp)transaction_73, (funcp)transaction_76, (funcp)transaction_77, (funcp)transaction_78, (funcp)transaction_85, (funcp)transaction_99, (funcp)transaction_103, (funcp)transaction_110, (funcp)transaction_119, (funcp)transaction_245, (funcp)transaction_262, (funcp)transaction_263};
const int NumRelocateId= 196;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/duc_nco_tb_behav/xsim.reloc",  (void **)funcTab, 196);
	iki_vhdl_file_variable_register(dp + 600096);
	iki_vhdl_file_variable_register(dp + 600152);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/duc_nco_tb_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 872528, dp + 871736, 0, 0, 0, 0, 1, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 872584, dp + 871792, 0, 31, 0, 31, 32, 1);

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/duc_nco_tb_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/duc_nco_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/duc_nco_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/duc_nco_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
