/**************************************************************************
 * func_00332510
 *
 * address      : 0x00332510 .. 0x00332e78  (2408 bytes, 602 instructions)
 * discovered by: called
 * called from  : 0x0032f340
 * string hint  : "InGameObjectsManipulator_Z"
 */
glabel func_00332510
  00332510  addiu      $sp, $sp, -0x10
  00332514  lui        $a1, 0x73
  00332518  sd         $ra, 0x0($sp)
  0033251c  lui        $at, 0x79
  00332520  lw         $a0, 0x5f70($at)
  00332524  lui        $a2, 0x73
  00332528  addiu      $a1, $a1, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  0033252c  addiu      $a2, $a2, -0x4028                       # 0x0072bfd8 "BaseObject_Z"
  00332530  jal        func_00309120
  00332534  daddu      $a3, $zero, $zero                       # delay slot
  00332538  lui        $at, 0x79
  0033253c  lui        $a1, 0x73
  00332540  lw         $a0, 0x5f70($at)
  00332544  lui        $a2, 0x73
  00332548  lui        $a3, 0x33
  0033254c  addiu      $a1, $a1, -0x4018                       # 0x0072bfe8 "World_Z"
  00332550  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  00332554  jal        func_00309120
  00332558  addiu      $a3, $a3, 0x78b0                        # delay slot; 0x003378b0 -> func_003378B0
  0033255c  lui        $at, 0x79
  00332560  lui        $a1, 0x73
  00332564  lw         $a0, 0x5f70($at)
  00332568  lui        $a2, 0x73
  0033256c  lui        $a3, 0x33
  00332570  addiu      $a1, $a1, -0x4010                       # 0x0072bff0 "GenWorld_Z"
  00332574  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332578  jal        func_00309120
  0033257c  addiu      $a3, $a3, 0x7800                        # delay slot; 0x00337800 -> func_00337800
  00332580  lui        $at, 0x79
  00332584  lui        $a1, 0x73
  00332588  lw         $a0, 0x5f70($at)
  0033258c  lui        $a2, 0x73
  00332590  lui        $a3, 0x33
  00332594  addiu      $a1, $a1, -0x3ff0                       # 0x0072c010 "SubWorld_Z"
  00332598  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  0033259c  jal        func_00309120
  003325a0  addiu      $a3, $a3, 0x77c0                        # delay slot; 0x003377c0 -> func_003377C0
  003325a4  lui        $at, 0x79
  003325a8  lui        $a1, 0x73
  003325ac  lw         $a0, 0x5f70($at)
  003325b0  lui        $a2, 0x73
  003325b4  lui        $a3, 0x33
  003325b8  addiu      $a1, $a1, -0x4000                       # 0x0072c000 "Object_Z"
  003325bc  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  003325c0  jal        func_00309120
  003325c4  addiu      $a3, $a3, 0x7780                        # delay slot; 0x00337780 -> func_00337780
  003325c8  lui        $at, 0x79
  003325cc  lui        $a1, 0x73
  003325d0  lw         $a0, 0x5f70($at)
  003325d4  lui        $a2, 0x73
  003325d8  addiu      $a1, $a1, -0x3fe0                       # 0x0072c020 "ObjectData_Z"
  003325dc  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  003325e0  jal        func_00309120
  003325e4  daddu      $a3, $zero, $zero                       # delay slot
  003325e8  lui        $at, 0x79
  003325ec  lui        $a1, 0x73
  003325f0  lw         $a0, 0x5f70($at)
  003325f4  lui        $a2, 0x73
  003325f8  lui        $a3, 0x33
  003325fc  addiu      $a1, $a1, -0x3fd0                       # 0x0072c030 "Points_Z"
  00332600  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332604  jal        func_00309120
  00332608  addiu      $a3, $a3, 0x7740                        # delay slot; 0x00337740 -> func_00337740
  0033260c  lui        $at, 0x79
  00332610  lui        $a1, 0x73
  00332614  lw         $a0, 0x5f70($at)
  00332618  lui        $a2, 0x73
  0033261c  lui        $a3, 0x33
  00332620  addiu      $a1, $a1, -0x3fc0                       # 0x0072c040 "Node_Z"
  00332624  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  00332628  jal        func_00309120
  0033262c  addiu      $a3, $a3, 0x7700                        # delay slot; 0x00337700 -> func_00337700
  00332630  lui        $at, 0x79
  00332634  lui        $a1, 0x73
  00332638  lw         $a0, 0x5f70($at)
  0033263c  lui        $a2, 0x73
  00332640  lui        $a3, 0x33
  00332644  addiu      $a1, $a1, -0x3fb8                       # 0x0072c048 "Bitmap_Z"
  00332648  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  0033264c  jal        func_00309120
  00332650  addiu      $a3, $a3, 0x76c0                        # delay slot; 0x003376c0 -> func_003376C0
  00332654  lui        $at, 0x79
  00332658  lui        $a1, 0x73
  0033265c  lw         $a0, 0x5f70($at)
  00332660  lui        $a2, 0x73
  00332664  lui        $a3, 0x33
  00332668  addiu      $a1, $a1, -0x3fa8                       # 0x0072c058 "Spline_Z"
  0033266c  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332670  jal        func_00309120
  00332674  addiu      $a3, $a3, 0x7680                        # delay slot; 0x00337680 -> func_00337680
  00332678  lui        $at, 0x79
  0033267c  lui        $a1, 0x73
  00332680  lw         $a0, 0x5f70($at)
  00332684  lui        $a2, 0x73
  00332688  lui        $a3, 0x33
  0033268c  addiu      $a1, $a1, -0x3f98                       # 0x0072c068 "Road_Z"
  00332690  addiu      $a2, $a2, -0x3fa8                       # 0x0072c058 "Spline_Z"
  00332694  jal        func_00309120
  00332698  addiu      $a3, $a3, 0x7640                        # delay slot; 0x00337640 -> func_00337640
  0033269c  lui        $at, 0x79
  003326a0  lui        $a1, 0x73
  003326a4  lw         $a0, 0x5f70($at)
  003326a8  lui        $a2, 0x73
  003326ac  lui        $a3, 0x33
  003326b0  addiu      $a1, $a1, -0x3f90                       # 0x0072c070 "SplineZone_Z"
  003326b4  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  003326b8  jal        func_00309120
  003326bc  addiu      $a3, $a3, 0x7600                        # delay slot; 0x00337600 -> func_00337600
  003326c0  lui        $at, 0x79
  003326c4  lui        $a1, 0x73
  003326c8  lw         $a0, 0x5f70($at)
  003326cc  lui        $a2, 0x73
  003326d0  lui        $a3, 0x33
  003326d4  addiu      $a1, $a1, -0x3f80                       # 0x0072c080 "Occluder_Z"
  003326d8  addiu      $a2, $a2, -0x3f90                       # 0x0072c070 "SplineZone_Z"
  003326dc  jal        func_00309120
  003326e0  addiu      $a3, $a3, 0x75c0                        # delay slot; 0x003375c0 -> func_003375C0
  003326e4  lui        $at, 0x79
  003326e8  lui        $a1, 0x73
  003326ec  lw         $a0, 0x5f70($at)
  003326f0  lui        $a2, 0x73
  003326f4  lui        $a3, 0x33
  003326f8  addiu      $a1, $a1, -0x3f70                       # 0x0072c090 "CameraZone_Z"
  003326fc  addiu      $a2, $a2, -0x3f90                       # 0x0072c070 "SplineZone_Z"
  00332700  jal        func_00309120
  00332704  addiu      $a3, $a3, 0x7580                        # delay slot; 0x00337580 -> func_00337580
  00332708  lui        $at, 0x79
  0033270c  lui        $a1, 0x73
  00332710  lw         $a0, 0x5f70($at)
  00332714  lui        $a2, 0x73
  00332718  lui        $a3, 0x33
  0033271c  addiu      $a1, $a1, -0x3f60                       # 0x0072c0a0 "Light_Z"
  00332720  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332724  jal        func_00309120
  00332728  addiu      $a3, $a3, 0x7540                        # delay slot; 0x00337540 -> func_00337540
  0033272c  lui        $at, 0x79
  00332730  lui        $a1, 0x73
  00332734  lw         $a0, 0x5f70($at)
  00332738  lui        $a2, 0x73
  0033273c  lui        $a3, 0x33
  00332740  addiu      $a1, $a1, -0x3f58                       # 0x0072c0a8 "LightData_Z"
  00332744  addiu      $a2, $a2, -0x3fe0                       # 0x0072c020 "ObjectData_Z"
  00332748  jal        func_00309120
  0033274c  addiu      $a3, $a3, 0x7500                        # delay slot; 0x00337500 -> func_00337500
  00332750  lui        $at, 0x79
  00332754  lui        $a1, 0x73
  00332758  lw         $a0, 0x5f70($at)
  0033275c  lui        $a2, 0x73
  00332760  lui        $a3, 0x33
  00332764  addiu      $a1, $a1, -0x3f48                       # 0x0072c0b8 "HFog_Z"
  00332768  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  0033276c  jal        func_00309120
  00332770  addiu      $a3, $a3, 0x74c0                        # delay slot; 0x003374c0 -> func_003374C0
  00332774  lui        $at, 0x79
  00332778  lui        $a1, 0x73
  0033277c  lw         $a0, 0x5f70($at)
  00332780  lui        $a2, 0x73
  00332784  lui        $a3, 0x33
  00332788  addiu      $a1, $a1, -0x3f40                       # 0x0072c0c0 "HFogData_Z"
  0033278c  addiu      $a2, $a2, -0x3fe0                       # 0x0072c020 "ObjectData_Z"
  00332790  jal        func_00309120
  00332794  addiu      $a3, $a3, 0x7460                        # delay slot; 0x00337460 -> func_00337460
  00332798  lui        $at, 0x79
  0033279c  lui        $a1, 0x73
  003327a0  lw         $a0, 0x5f70($at)
  003327a4  lui        $a2, 0x73
  003327a8  lui        $a3, 0x33
  003327ac  addiu      $a1, $a1, -0x3f30                       # 0x0072c0d0 "Omni_Z"
  003327b0  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  003327b4  jal        func_00309120
  003327b8  addiu      $a3, $a3, 0x7420                        # delay slot; 0x00337420 -> func_00337420
  003327bc  lui        $at, 0x79
  003327c0  lui        $a1, 0x73
  003327c4  lw         $a0, 0x5f70($at)
  003327c8  lui        $a2, 0x73
  003327cc  lui        $a3, 0x33
  003327d0  addiu      $a1, $a1, -0x3f28                       # 0x0072c0d8 "Emiter_Z"
  003327d4  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  003327d8  jal        func_00309120
  003327dc  addiu      $a3, $a3, 0x73e0                        # delay slot; 0x003373e0 -> func_003373E0
  003327e0  lui        $at, 0x79
  003327e4  lui        $a1, 0x73
  003327e8  lw         $a0, 0x5f70($at)
  003327ec  lui        $a2, 0x73
  003327f0  lui        $a3, 0x33
  003327f4  addiu      $a1, $a1, -0x3f18                       # 0x0072c0e8 "Tree_Z"
  003327f8  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  003327fc  jal        func_00309120
  00332800  addiu      $a3, $a3, 0x73a0                        # delay slot; 0x003373a0 -> func_003373A0
  00332804  lui        $at, 0x79
  00332808  lui        $a1, 0x73
  0033280c  lw         $a0, 0x5f70($at)
  00332810  lui        $a2, 0x73
  00332814  lui        $a3, 0x33
  00332818  addiu      $a1, $a1, -0x3f10                       # 0x0072c0f0 "CollisionVol_Z"
  0033281c  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332820  jal        func_00309120
  00332824  addiu      $a3, $a3, 0x7360                        # delay slot; 0x00337360 -> func_00337360
  00332828  lui        $at, 0x79
  0033282c  lui        $a1, 0x73
  00332830  lw         $a0, 0x5f70($at)
  00332834  lui        $a2, 0x73
  00332838  lui        $a3, 0x33
  0033283c  addiu      $a1, $a1, -0x3f00                       # 0x0072c100 "Camera_Z"
  00332840  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332844  jal        func_00309120
  00332848  addiu      $a3, $a3, 0x7320                        # delay slot; 0x00337320 -> func_00337320
  0033284c  lui        $at, 0x79
  00332850  lui        $a1, 0x73
  00332854  lw         $a0, 0x5f70($at)
  00332858  lui        $a2, 0x73
  0033285c  lui        $a3, 0x33
  00332860  addiu      $a1, $a1, -0x3ef0                       # 0x0072c110 "Game_Z"
  00332864  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332868  jal        func_00309120
  0033286c  addiu      $a3, $a3, 0x6f60                        # delay slot; 0x00336f60 -> func_00336F60
  00332870  lui        $at, 0x79
  00332874  lui        $a1, 0x73
  00332878  lw         $a0, 0x5f70($at)
  0033287c  lui        $a2, 0x73
  00332880  lui        $a3, 0x33
  00332884  addiu      $a1, $a1, -0x3ee8                       # 0x0072c118 "GameObj_Z"
  00332888  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  0033288c  jal        func_00309120
  00332890  addiu      $a3, $a3, 0x6de0                        # delay slot; 0x00336de0 -> func_00336DE0
  00332894  lui        $at, 0x79
  00332898  lui        $a1, 0x73
  0033289c  lw         $a0, 0x5f70($at)
  003328a0  lui        $a2, 0x73
  003328a4  lui        $a3, 0x33
  003328a8  addiu      $a1, $a1, -0x3ed8                       # 0x0072c128 "MaterialAnim_Z"
  003328ac  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  003328b0  jal        func_00309120
  003328b4  addiu      $a3, $a3, 0x6da0                        # delay slot; 0x00336da0 -> func_00336DA0
  003328b8  lui        $at, 0x79
  003328bc  lui        $a1, 0x73
  003328c0  lw         $a0, 0x5f70($at)
  003328c4  lui        $a2, 0x73
  003328c8  lui        $a3, 0x33
  003328cc  addiu      $a1, $a1, -0x3ec8                       # 0x0072c138 "MaterialObj_Z"
  003328d0  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  003328d4  jal        func_00309120
  003328d8  addiu      $a3, $a3, 0x6c20                        # delay slot; 0x00336c20 -> func_00336C20
  003328dc  lui        $at, 0x79
  003328e0  lui        $a1, 0x73
  003328e4  lw         $a0, 0x5f70($at)
  003328e8  lui        $a2, 0x73
  003328ec  lui        $a3, 0x33
  003328f0  addiu      $a1, $a1, -0x3eb8                       # 0x0072c148 "Fonts_Z"
  003328f4  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  003328f8  jal        func_00309120
  003328fc  addiu      $a3, $a3, 0x6b60                        # delay slot; 0x00336b60 -> func_00336B60
  00332900  lui        $at, 0x79
  00332904  lui        $a1, 0x73
  00332908  lw         $a0, 0x5f70($at)
  0033290c  lui        $a2, 0x73
  00332910  lui        $a3, 0x33
  00332914  addiu      $a1, $a1, -0x3eb0                       # 0x0072c150 "AnimFrame_Z"
  00332918  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  0033291c  jal        func_00309120
  00332920  addiu      $a3, $a3, 0x6b20                        # delay slot; 0x00336b20 -> func_00336B20
  00332924  lui        $at, 0x79
  00332928  lui        $a1, 0x73
  0033292c  lw         $a0, 0x5f70($at)
  00332930  lui        $a2, 0x73
  00332934  lui        $a3, 0x33
  00332938  addiu      $a1, $a1, -0x3ea0                       # 0x0072c160 "Rtc_Z"
  0033293c  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  00332940  jal        func_00309120
  00332944  addiu      $a3, $a3, 0x6ae0                        # delay slot; 0x00336ae0 -> func_00336AE0
  00332948  lui        $at, 0x79
  0033294c  lui        $a1, 0x73
  00332950  lw         $a0, 0x5f70($at)
  00332954  lui        $a2, 0x73
  00332958  lui        $a3, 0x33
  0033295c  addiu      $a1, $a1, -0x3e98                       # 0x0072c168 "Graph_Z"
  00332960  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  00332964  jal        func_00309120
  00332968  addiu      $a3, $a3, 0x6aa0                        # delay slot; 0x00336aa0 -> func_00336AA0
  0033296c  lui        $at, 0x79
  00332970  lui        $a1, 0x73
  00332974  lw         $a0, 0x5f70($at)
  00332978  lui        $a2, 0x73
  0033297c  lui        $a3, 0x33
  00332980  addiu      $a1, $a1, -0x3e90                       # 0x0072c170 "SplineGraph_Z"
  00332984  addiu      $a2, $a2, -0x3fa8                       # 0x0072c058 "Spline_Z"
  00332988  jal        func_00309120
  0033298c  addiu      $a3, $a3, 0x6a60                        # delay slot; 0x00336a60 -> func_00336A60
  00332990  lui        $at, 0x79
  00332994  lui        $a1, 0x73
  00332998  lw         $a0, 0x5f70($at)
  0033299c  lui        $a2, 0x73
  003329a0  lui        $a3, 0x33
  003329a4  addiu      $a1, $a1, -0x3e80                       # 0x0072c180 "UserDefine_Z"
  003329a8  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  003329ac  jal        func_00309120
  003329b0  addiu      $a3, $a3, 0x6a20                        # delay slot; 0x00336a20 -> func_00336A20
  003329b4  lui        $at, 0x79
  003329b8  lui        $a1, 0x73
  003329bc  lw         $a0, 0x5f70($at)
  003329c0  lui        $a2, 0x73
  003329c4  addiu      $a1, $a1, -0x3e70                       # 0x0072c190 "PointsData_Z"
  003329c8  addiu      $a2, $a2, -0x3fe0                       # 0x0072c020 "ObjectData_Z"
  003329cc  jal        func_00309120
  003329d0  daddu      $a3, $zero, $zero                       # delay slot
  003329d4  lui        $at, 0x79
  003329d8  lui        $a1, 0x73
  003329dc  lw         $a0, 0x5f70($at)
  003329e0  lui        $a2, 0x73
  003329e4  lui        $a3, 0x33
  003329e8  addiu      $a1, $a1, -0x3e60                       # 0x0072c1a0 "Txt_Z"
  003329ec  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  003329f0  jal        func_00309120
  003329f4  addiu      $a3, $a3, 0x69a0                        # delay slot; 0x003369a0 -> func_003369A0
  003329f8  lui        $at, 0x79
  003329fc  lui        $a1, 0x73
  00332a00  lw         $a0, 0x5f70($at)
  00332a04  lui        $a2, 0x73
  00332a08  lui        $a3, 0x33
  00332a0c  addiu      $a1, $a1, -0x3e58                       # 0x0072c1a8 "Binary_Z"
  00332a10  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  00332a14  jal        func_00309120
  00332a18  addiu      $a3, $a3, 0x6960                        # delay slot; 0x00336960 -> func_00336960
  00332a1c  lui        $at, 0x79
  00332a20  lui        $a1, 0x73
  00332a24  lw         $a0, 0x5f70($at)
  00332a28  lui        $a2, 0x73
  00332a2c  lui        $a3, 0x33
  00332a30  addiu      $a1, $a1, -0x3e48                       # 0x0072c1b8 "Animation_Z"
  00332a34  addiu      $a2, $a2, -0x4040                       # 0x0072bfc0 "ResourceObject_Z"
  00332a38  jal        func_00309120
  00332a3c  addiu      $a3, $a3, 0x6550                        # delay slot; 0x00336550 -> func_00336550
  00332a40  lui        $at, 0x79
  00332a44  lui        $a1, 0x73
  00332a48  lw         $a0, 0x5f70($at)
  00332a4c  lui        $a2, 0x73
  00332a50  lui        $a3, 0x33
  00332a54  addiu      $a1, $a1, -0x3e30                       # 0x0072c1d0 "GenWorldSurface_Z"
  00332a58  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332a5c  jal        func_00309120
  00332a60  addiu      $a3, $a3, 0x6510                        # delay slot; 0x00336510 -> func_00336510
  00332a64  lui        $at, 0x79
  00332a68  lui        $a1, 0x73
  00332a6c  lw         $a0, 0x5f70($at)
  00332a70  lui        $a2, 0x73
  00332a74  lui        $a3, 0x33
  00332a78  addiu      $a1, $a1, -0x3e18                       # 0x0072c1e8 "WorldRef_Z"
  00332a7c  addiu      $a2, $a2, -0x4000                       # 0x0072c000 "Object_Z"
  00332a80  jal        func_00309120
  00332a84  addiu      $a3, $a3, 0x64d0                        # delay slot; 0x003364d0 -> func_003364D0
  00332a88  lui        $at, 0x79
  00332a8c  lui        $a1, 0x73
  00332a90  lw         $a0, 0x5f70($at)
  00332a94  addiu      $a1, $a1, -0x3e48                       # 0x0072c1b8 "Animation_Z"
  00332a98  addiu      $a2, $zero, 0x1
  00332a9c  jal        func_003094A0
  00332aa0  daddu      $a3, $zero, $zero                       # delay slot
  00332aa4  jal        func_002DDDA0
  00332aa8  nop                                                # delay slot
  00332aac  lui        $at, 0x79
  00332ab0  lui        $a1, 0x73
  00332ab4  lw         $a0, 0x5f70($at)
  00332ab8  lui        $a2, 0x73
  00332abc  addiu      $a1, $a1, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332ac0  addiu      $a2, $a2, -0x4028                       # 0x0072bfd8 "BaseObject_Z"
  00332ac4  jal        func_00309120
  00332ac8  daddu      $a3, $zero, $zero                       # delay slot
  00332acc  lui        $at, 0x79
  00332ad0  lui        $a1, 0x73
  00332ad4  lw         $a0, 0x5f70($at)
  00332ad8  lui        $a2, 0x73
  00332adc  addiu      $a1, $a1, -0x3df0                       # 0x0072c210 "ManipulatorDraw_Z"
  00332ae0  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332ae4  jal        func_00309120
  00332ae8  daddu      $a3, $zero, $zero                       # delay slot
  00332aec  lui        $at, 0x79
  00332af0  lui        $a1, 0x73
  00332af4  lw         $a0, 0x5f70($at)
  00332af8  lui        $a2, 0x73
  00332afc  lui        $a3, 0x33
  00332b00  addiu      $a1, $a1, -0x3dd8                       # 0x0072c228 "PlayAnim_Z"
  00332b04  addiu      $a2, $a2, -0x3dc8                       # 0x0072c238 "BasePlayAnim_Z"
  00332b08  jal        func_00309120
  00332b0c  addiu      $a3, $a3, 0x5de0                        # delay slot; 0x00335de0 -> func_00335DE0
  00332b10  lui        $at, 0x79
  00332b14  lui        $a1, 0x73
  00332b18  lw         $a0, 0x5f70($at)
  00332b1c  lui        $a2, 0x73
  00332b20  lui        $a3, 0x33
  00332b24  addiu      $a1, $a1, -0x3db0                       # 0x0072c250 "PlayBlendAnim_Z"
  00332b28  addiu      $a2, $a2, -0x3dc8                       # 0x0072c238 "BasePlayAnim_Z"
  00332b2c  jal        func_00309120
  00332b30  addiu      $a3, $a3, 0x4b50                        # delay slot; 0x00334b50 -> func_00334B50
  00332b34  lui        $at, 0x79
  00332b38  lui        $a1, 0x73
  00332b3c  lw         $a0, 0x5f70($at)
  00332b40  lui        $a2, 0x73
  00332b44  addiu      $a1, $a1, -0x3da0                       # 0x0072c260 "DynamicAnim_Z"
  00332b48  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332b4c  jal        func_00309120
  00332b50  daddu      $a3, $zero, $zero                       # delay slot
  00332b54  lui        $at, 0x79
  00332b58  lui        $a1, 0x73
  00332b5c  lw         $a0, 0x5f70($at)
  00332b60  lui        $a2, 0x73
  00332b64  lui        $a3, 0x33
  00332b68  addiu      $a1, $a1, -0x3d90                       # 0x0072c270 "DynamicAnim2_Z"
  00332b6c  addiu      $a2, $a2, -0x3da0                       # 0x0072c260 "DynamicAnim_Z"
  00332b70  jal        func_00309120
  00332b74  addiu      $a3, $a3, 0x4a30                        # delay slot; 0x00334a30 -> func_00334A30
  00332b78  lui        $at, 0x79
  00332b7c  lui        $a1, 0x73
  00332b80  lw         $a0, 0x5f70($at)
  00332b84  lui        $a2, 0x73
  00332b88  lui        $a3, 0x33
  00332b8c  addiu      $a1, $a1, -0x3d80                       # 0x0072c280 "SequenceAnim_Z"
  00332b90  addiu      $a2, $a2, -0x4028                       # 0x0072bfd8 "BaseObject_Z"
  00332b94  jal        func_00309120
  00332b98  addiu      $a3, $a3, 0x49f0                        # delay slot; 0x003349f0 -> func_003349F0
  00332b9c  lui        $at, 0x79
  00332ba0  lui        $a1, 0x73
  00332ba4  lw         $a0, 0x5f70($at)
  00332ba8  lui        $a2, 0x73
  00332bac  lui        $a3, 0x33
  00332bb0  addiu      $a1, $a1, -0x3d70                       # 0x0072c290 "SequenceMixAnim_Z"
  00332bb4  addiu      $a2, $a2, -0x3d80                       # 0x0072c280 "SequenceAnim_Z"
  00332bb8  jal        func_00309120
  00332bbc  addiu      $a3, $a3, 0x49b0                        # delay slot; 0x003349b0 -> func_003349B0
  00332bc0  lui        $at, 0x79
  00332bc4  lui        $a1, 0x73
  00332bc8  lw         $a0, 0x5f70($at)
  00332bcc  lui        $a2, 0x73
  00332bd0  lui        $a3, 0x33
  00332bd4  addiu      $a1, $a1, -0x3d50                       # 0x0072c2b0 "CameraOccluder_Z"
  00332bd8  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332bdc  jal        func_00309120
  00332be0  addiu      $a3, $a3, 0x4950                        # delay slot; 0x00334950 -> func_00334950
  00332be4  lui        $at, 0x79
  00332be8  lui        $a1, 0x73
  00332bec  lw         $a0, 0x5f70($at)
  00332bf0  lui        $a2, 0x73
  00332bf4  lui        $a3, 0x33
  00332bf8  addiu      $a1, $a1, -0x3d38                       # 0x0072c2c8 "CameraStream_Z"
  00332bfc  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332c00  jal        func_00309120
  00332c04  addiu      $a3, $a3, 0x48f0                        # delay slot; 0x003348f0 -> func_003348F0
  00332c08  lui        $at, 0x79
  00332c0c  lui        $a1, 0x73
  00332c10  lw         $a0, 0x5f70($at)
  00332c14  lui        $a2, 0x73
  00332c18  addiu      $a1, $a1, -0x3d28                       # 0x0072c2d8 "CameraEngine_Z"
  00332c1c  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332c20  jal        func_00309120
  00332c24  daddu      $a3, $zero, $zero                       # delay slot
  00332c28  lui        $at, 0x79
  00332c2c  lui        $a1, 0x73
  00332c30  lw         $a0, 0x5f70($at)
  00332c34  lui        $a2, 0x73
  00332c38  lui        $a3, 0x33
  00332c3c  addiu      $a1, $a1, -0x3d10                       # 0x0072c2f0 "CameraEngineZone_Z"
  00332c40  addiu      $a2, $a2, -0x3d28                       # 0x0072c2d8 "CameraEngine_Z"
  00332c44  jal        func_00309120
  00332c48  addiu      $a3, $a3, 0x4820                        # delay slot; 0x00334820 -> func_00334820
  00332c4c  lui        $at, 0x79
  00332c50  lui        $a1, 0x73
  00332c54  lw         $a0, 0x5f70($at)
  00332c58  lui        $a2, 0x73
  00332c5c  lui        $a3, 0x33
  00332c60  addiu      $a1, $a1, -0x3cf8                       # 0x0072c308 "ObjectMove_Z"
  00332c64  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332c68  jal        func_00309120
  00332c6c  addiu      $a3, $a3, 0x4740                        # delay slot; 0x00334740 -> func_00334740
  00332c70  lui        $at, 0x79
  00332c74  lui        $a1, 0x73
  00332c78  lw         $a0, 0x5f70($at)
  00332c7c  lui        $a2, 0x73
  00332c80  lui        $a3, 0x33
  00332c84  addiu      $a1, $a1, -0x3ce8                       # 0x0072c318 "ObjectThrow_Z"
  00332c88  addiu      $a2, $a2, -0x3cf8                       # 0x0072c308 "ObjectMove_Z"
  00332c8c  jal        func_00309120
  00332c90  addiu      $a3, $a3, 0x4670                        # delay slot; 0x00334670 -> func_00334670
  00332c94  lui        $at, 0x79
  00332c98  lui        $a1, 0x73
  00332c9c  lw         $a0, 0x5f70($at)
  00332ca0  lui        $a2, 0x73
  00332ca4  lui        $a3, 0x33
  00332ca8  addiu      $a1, $a1, -0x3cd8                       # 0x0072c328 "LodMove_Z"
  00332cac  addiu      $a2, $a2, -0x3ce8                       # 0x0072c318 "ObjectThrow_Z"
  00332cb0  jal        func_00309120
  00332cb4  addiu      $a3, $a3, 0x45e0                        # delay slot; 0x003345e0 -> func_003345E0
  00332cb8  lui        $at, 0x79
  00332cbc  lui        $a1, 0x73
  00332cc0  lw         $a0, 0x5f70($at)
  00332cc4  lui        $a2, 0x73
  00332cc8  lui        $a3, 0x33
  00332ccc  addiu      $a1, $a1, -0x3cc8                       # 0x0072c338 "VehiculeMove_Z"
  00332cd0  addiu      $a2, $a2, -0x3cd8                       # 0x0072c328 "LodMove_Z"
  00332cd4  jal        func_00309120
  00332cd8  addiu      $a3, $a3, 0x4580                        # delay slot; 0x00334580 -> func_00334580
  00332cdc  lui        $at, 0x79
  00332ce0  lui        $a1, 0x73
  00332ce4  lw         $a0, 0x5f70($at)
  00332ce8  lui        $a2, 0x73
  00332cec  lui        $a3, 0x33
  00332cf0  addiu      $a1, $a1, -0x3cb8                       # 0x0072c348 "ObjectsGame_Z"
  00332cf4  addiu      $a2, $a2, -0x3ca8                       # 0x0072c358 "ObjectGame_Z"
  00332cf8  jal        func_00309120
  00332cfc  addiu      $a3, $a3, 0x4390                        # delay slot; 0x00334390 -> func_00334390
  00332d00  lui        $at, 0x79
  00332d04  lui        $a1, 0x73
  00332d08  lw         $a0, 0x5f70($at)
  00332d0c  lui        $a2, 0x73
  00332d10  lui        $a3, 0x33
  00332d14  addiu      $a1, $a1, -0x3c98                       # 0x0072c368 "PhysicObj_Z"
  00332d18  addiu      $a2, $a2, -0x3cd8                       # 0x0072c328 "LodMove_Z"
  00332d1c  jal        func_00309120
  00332d20  addiu      $a3, $a3, 0x4350                        # delay slot; 0x00334350 -> func_00334350
  00332d24  lui        $at, 0x79
  00332d28  lui        $a1, 0x73
  00332d2c  lw         $a0, 0x5f70($at)
  00332d30  lui        $a2, 0x73
  00332d34  lui        $a3, 0x33
  00332d38  addiu      $a1, $a1, -0x3c88                       # 0x0072c378 "PhysicWorld_Z"
  00332d3c  addiu      $a2, $a2, -0x3ca8                       # 0x0072c358 "ObjectGame_Z"
  00332d40  jal        func_00309120
  00332d44  addiu      $a3, $a3, 0x3500                        # delay slot; 0x00333500 -> func_00333500
  00332d48  lui        $at, 0x79
  00332d4c  lui        $a1, 0x73
  00332d50  lw         $a0, 0x5f70($at)
  00332d54  lui        $a2, 0x73
  00332d58  lui        $a3, 0x33
  00332d5c  addiu      $a1, $a1, -0x3c70                       # 0x0072c390 "ObjectsGameClip_Z"
  00332d60  addiu      $a2, $a2, -0x3ca8                       # 0x0072c358 "ObjectGame_Z"
  00332d64  jal        func_00309120
  00332d68  addiu      $a3, $a3, 0x3480                        # delay slot; 0x00333480 -> func_00333480
  00332d6c  lui        $at, 0x79
  00332d70  lui        $a1, 0x73
  00332d74  lw         $a0, 0x5f70($at)
  00332d78  lui        $a2, 0x73
  00332d7c  lui        $a3, 0x33
  00332d80  addiu      $a1, $a1, -0x3c58                       # 0x0072c3a8 "RtcPlayer_Z"
  00332d84  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332d88  jal        func_00309120
  00332d8c  addiu      $a3, $a3, 0x3440                        # delay slot; 0x00333440 -> func_00333440
  00332d90  lui        $at, 0x79
  00332d94  lui        $a1, 0x73
  00332d98  lw         $a0, 0x5f70($at)
  00332d9c  lui        $a2, 0x73
  00332da0  lui        $a3, 0x24
  00332da4  addiu      $a1, $a1, -0x3c48                       # 0x0072c3b8 "InGameDatas_Z"
  00332da8  addiu      $a2, $a2, -0x3df0                       # 0x0072c210 "ManipulatorDraw_Z"
  00332dac  jal        func_00309120
  00332db0  addiu      $a3, $a3, 0x5b50                        # delay slot; 0x00245b50 -> func_00245B50
  00332db4  lui        $at, 0x79
  00332db8  lui        $a1, 0x73
  00332dbc  lw         $a0, 0x5f70($at)
  00332dc0  lui        $a2, 0x73
  00332dc4  addiu      $a1, $a1, -0x3c30                       # 0x0072c3d0 "PlayParticles_Z"
  00332dc8  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332dcc  jal        func_00309120
  00332dd0  daddu      $a3, $zero, $zero                       # delay slot
  00332dd4  lui        $at, 0x79
  00332dd8  lui        $a1, 0x73
  00332ddc  lw         $a0, 0x5f70($at)
  00332de0  lui        $a2, 0x73
  00332de4  lui        $a3, 0x33
  00332de8  addiu      $a1, $a1, -0x3c20                       # 0x0072c3e0 "SuperSpray_Z"
  00332dec  addiu      $a2, $a2, -0x3c30                       # 0x0072c3d0 "PlayParticles_Z"
  00332df0  jal        func_00309120
  00332df4  addiu      $a3, $a3, 0x3370                        # delay slot; 0x00333370 -> func_00333370
  00332df8  lui        $at, 0x79
  00332dfc  lui        $a1, 0x73
  00332e00  lw         $a0, 0x5f70($at)
  00332e04  lui        $a2, 0x73
  00332e08  lui        $a3, 0x33
  00332e0c  addiu      $a1, $a1, -0x3c10                       # 0x0072c3f0 "InGameObjectsManipulator_Z"
  00332e10  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332e14  jal        func_00309120
  00332e18  addiu      $a3, $a3, 0x3330                        # delay slot; 0x00333330 -> func_00333330
  00332e1c  lui        $at, 0x79
  00332e20  lui        $a1, 0x73
  00332e24  lw         $a0, 0x5f70($at)
  00332e28  lui        $a2, 0x73
  00332e2c  lui        $a3, 0x33
  00332e30  addiu      $a1, $a1, -0x3bf0                       # 0x0072c410 "StreamFile_Z"
  00332e34  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332e38  jal        func_00309120
  00332e3c  addiu      $a3, $a3, 0x3000                        # delay slot; 0x00333000 -> func_00333000
  00332e40  lui        $at, 0x79
  00332e44  lui        $a1, 0x73
  00332e48  lw         $a0, 0x5f70($at)
  00332e4c  lui        $a2, 0x73
  00332e50  lui        $a3, 0x33
  00332e54  addiu      $a1, $a1, -0x3be0                       # 0x0072c420 "ConsoleInterp_Z"
  00332e58  addiu      $a2, $a2, -0x3e08                       # 0x0072c1f8 "Manipulator_Z"
  00332e5c  jal        func_00309120
  00332e60  addiu      $a3, $a3, 0x2e80                        # delay slot; 0x00332e80 -> func_00332E80
  00332e64  jal        func_00241E00
  00332e68  nop                                                # delay slot
  00332e6c  ld         $ra, 0x0($sp)
  00332e70  jr         $ra
  00332e74  addiu      $sp, $sp, 0x10                          # delay slot
/* end of func_00332510 */
