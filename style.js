/* Generated by the Nim Compiler v1.4.0 */
var framePtr = null;
var excHandler = 0;
var lastJSError = null;
if (typeof Int8Array === 'undefined') Int8Array = Array;
if (typeof Int16Array === 'undefined') Int16Array = Array;
if (typeof Int32Array === 'undefined') Int32Array = Array;
if (typeof Uint8Array === 'undefined') Uint8Array = Array;
if (typeof Uint16Array === 'undefined') Uint16Array = Array;
if (typeof Uint32Array === 'undefined') Uint32Array = Array;
if (typeof Float32Array === 'undefined') Float32Array = Array;
if (typeof Float64Array === 'undefined') Float64Array = Array;
var NTI1214621 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214623 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214653 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI11012028 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214641 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214633 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214637 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214408 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214728 = {size: 0,kind: 22,base: null,node: null,finalizer: null};
var NTI1208015 = {size: 0,kind: 29,base: null,node: null,finalizer: null};
var NTI1214723 = {size: 0,kind: 22,base: null,node: null,finalizer: null};
var NTI1214617 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214619 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1214649 = {size: 0, kind: 17, base: null, node: null, finalizer: null};
var NTI1208013 = {size: 0,kind: 28,base: null,node: null,finalizer: null};
var NNI1214649 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214649.node = NNI1214649;
var NNI1214619 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214619.node = NNI1214619;
NTI1214723.base = NTI1214617;
NTI1214728.base = NTI1214617;
var NNI1214617 = {kind: 2, len: 5, offset: 0, typ: null, name: null, sons: [{kind: 1, offset: "parent", len: 0, typ: NTI1214723, name: "parent", sons: null}, 
{kind: 1, offset: "name", len: 0, typ: NTI1208015, name: "name", sons: null}, 
{kind: 1, offset: "message", len: 0, typ: NTI1208013, name: "msg", sons: null}, 
{kind: 1, offset: "trace", len: 0, typ: NTI1208013, name: "trace", sons: null}, 
{kind: 1, offset: "up", len: 0, typ: NTI1214728, name: "up", sons: null}]};
NTI1214617.node = NNI1214617;
var NNI1214408 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214408.node = NNI1214408;
NTI1214617.base = NTI1214408;
NTI1214619.base = NTI1214617;
NTI1214649.base = NTI1214619;
var NNI1214637 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214637.node = NNI1214637;
var NNI1214633 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214633.node = NNI1214633;
NTI1214633.base = NTI1214619;
NTI1214637.base = NTI1214633;
var NNI1214641 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214641.node = NNI1214641;
NTI1214641.base = NTI1214619;
var NNI11012028 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI11012028.node = NNI11012028;
NTI11012028.base = NTI1214617;
var NNI1214653 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214653.node = NNI1214653;
NTI1214653.base = NTI1214619;
var NNI1214623 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214623.node = NNI1214623;
var NNI1214621 = {kind: 2, len: 0, offset: 0, typ: null, name: null, sons: []};
NTI1214621.node = NNI1214621;
NTI1214621.base = NTI1214617;
NTI1214623.base = NTI1214621;
function toJSStr(s_1475096) {
                    var Tmp5;
            var Tmp7;

  var result_1475097 = null;

    var res_1475170 = newSeq_1475128((s_1475096).length);
    var i_1475172 = 0;
    var j_1475174 = 0;
    L1: do {
        L2: while (true) {
        if (!(i_1475172 < (s_1475096).length)) break L2;
          var c_1475175 = s_1475096[i_1475172];
          if ((c_1475175 < 128)) {
          res_1475170[j_1475174] = String.fromCharCode(c_1475175);
          i_1475172 += 1;
          }
          else {
            var helper_1475198 = newSeq_1475128(0);
            L3: do {
                L4: while (true) {
                if (!true) break L4;
                  var code_1475199 = c_1475175.toString(16);
                  if (((code_1475199).length == 1)) {
                  helper_1475198.push("%0");;
                  }
                  else {
                  helper_1475198.push("%");;
                  }
                  
                  helper_1475198.push(code_1475199);;
                  i_1475172 += 1;
                    if (((s_1475096).length <= i_1475172)) Tmp5 = true; else {                      Tmp5 = (s_1475096[i_1475172] < 128);                    }                  if (Tmp5) {
                  break L3;
                  }
                  
                  c_1475175 = s_1475096[i_1475172];
                }
            } while(false);
++excHandler;
            Tmp7 = framePtr;
            try {
            res_1475170[j_1475174] = decodeURIComponent(helper_1475198.join(""));
--excHandler;
} catch (EXC) {
 var prevJSError = lastJSError;
 lastJSError = EXC;
 --excHandler;
            framePtr = Tmp7;
            res_1475170[j_1475174] = helper_1475198.join("");
            lastJSError = prevJSError;
            } finally {
            framePtr = Tmp7;
            }
          }
          
          j_1475174 += 1;
        }
    } while(false);
    if (res_1475170.length < j_1475174) { for (var i=res_1475170.length;i<j_1475174;++i) res_1475170.push(null); }
               else { res_1475170.length = j_1475174; };
    result_1475097 = res_1475170.join("");

  return result_1475097;

}
function makeNimstrLit(c_1475062) {
      var ln = c_1475062.length;
  var result = new Array(ln);
  for (var i = 0; i < ln; ++i) {
    result[i] = c_1475062.charCodeAt(i);
  }
  return result;
  

  
}
function cstrToNimstr(c_1475079) {
      var ln = c_1475079.length;
  var result = new Array(ln);
  var r = 0;
  for (var i = 0; i < ln; ++i) {
    var ch = c_1475079.charCodeAt(i);

    if (ch < 128) {
      result[r] = ch;
    }
    else {
      if (ch < 2048) {
        result[r] = (ch >> 6) | 192;
      }
      else {
        if (ch < 55296 || ch >= 57344) {
          result[r] = (ch >> 12) | 224;
        }
        else {
            ++i;
            ch = 65536 + (((ch & 1023) << 10) | (c_1475079.charCodeAt(i) & 1023));
            result[r] = (ch >> 18) | 240;
            ++r;
            result[r] = ((ch >> 12) & 63) | 128;
        }
        ++r;
        result[r] = ((ch >> 6) & 63) | 128;
      }
      ++r;
      result[r] = (ch & 63) | 128;
    }
    ++r;
  }
  return result;
  

  
}
function setConstr() {
        var result = {};
    for (var i = 0; i < arguments.length; ++i) {
      var x = arguments[i];
      if (typeof(x) == "object") {
        for (var j = x[0]; j <= x[1]; ++j) {
          result[j] = true;
        }
      } else {
        result[x] = true;
      }
    }
    return result;
  

  
}
var ConstSet1 = setConstr(17, 16, 4, 18, 27, 19, 23, 22, 21);
function nimCopy(dest_1490023, src_1490024, ti_1490025) {
  var result_1495219 = null;

    switch (ti_1490025.kind) {
    case 21:
    case 22:
    case 23:
    case 5:
      if (!(isFatPointer_1485401(ti_1490025))) {
      result_1495219 = src_1490024;
      }
      else {
        result_1495219 = [src_1490024[0], src_1490024[1]];
      }
      
      break;
    case 19:
            if (dest_1490023 === null || dest_1490023 === undefined) {
        dest_1490023 = {};
      }
      else {
        for (var key in dest_1490023) { delete dest_1490023[key]; }
      }
      for (var key in src_1490024) { dest_1490023[key] = src_1490024[key]; }
      result_1495219 = dest_1490023;
    
      break;
    case 18:
    case 17:
      if (!((ti_1490025.base == null))) {
      result_1495219 = nimCopy(dest_1490023, src_1490024, ti_1490025.base);
      }
      else {
      if ((ti_1490025.kind == 17)) {
      result_1495219 = (dest_1490023 === null || dest_1490023 === undefined) ? {m_type: ti_1490025} : dest_1490023;
      }
      else {
        result_1495219 = (dest_1490023 === null || dest_1490023 === undefined) ? {} : dest_1490023;
      }
      }
      nimCopyAux(result_1495219, src_1490024, ti_1490025.node);
      break;
    case 24:
    case 4:
    case 27:
    case 16:
            if (src_1490024 === null) {
        result_1495219 = null;
      }
      else {
        if (dest_1490023 === null || dest_1490023 === undefined) {
          dest_1490023 = new Array(src_1490024.length);
        }
        else {
          dest_1490023.length = src_1490024.length;
        }
        result_1495219 = dest_1490023;
        for (var i = 0; i < src_1490024.length; ++i) {
          result_1495219[i] = nimCopy(result_1495219[i], src_1490024[i], ti_1490025.base);
        }
      }
    
      break;
    case 28:
            if (src_1490024 !== null) {
        result_1495219 = src_1490024.slice(0);
      }
    
      break;
    default: 
      result_1495219 = src_1490024;
      break;
    }

  return result_1495219;

}
function raiseException(e_1440218, ename_1440219) {
    e_1440218.name = ename_1440219;
    if ((excHandler == 0)) {
    unhandledException(e_1440218);
    }
    
    throw e_1440218;

  
}
function chckIndx(i_1500086, a_1500087, b_1500088) {
      var Tmp1;

  var result_1500089 = 0;

  BeforeRet: do {
      if (!(a_1500087 <= i_1500086)) Tmp1 = false; else {        Tmp1 = (i_1500086 <= b_1500088);      }    if (Tmp1) {
    result_1500089 = i_1500086;
    break BeforeRet;
    }
    else {
    raiseIndexError(i_1500086, a_1500087, b_1500088);
    }
    
  } while (false);

  return result_1500089;

}
function addInt(a_1480419, b_1480420) {
        var result = a_1480419 + b_1480420;
    checkOverflowInt(result);
    return result;
  

  
}
function subInt(a_1480437, b_1480438) {
        var result = a_1480437 - b_1480438;
    checkOverflowInt(result);
    return result;
  

  
}
var ConstSet2 = setConstr(47, 47);
function eqStrings(a_1480222, b_1480223) {
        if (a_1480222 == b_1480223) return true;
    if (a_1480222 === null && b_1480223.length == 0) return true;
    if (b_1480223 === null && a_1480222.length == 0) return true;
    if ((!a_1480222) || (!b_1480223)) return false;
    var alen = a_1480222.length;
    if (alen != b_1480223.length) return false;
    for (var i = 0; i < alen; ++i)
      if (a_1480222[i] != b_1480223[i]) return false;
    return true;
  

  
}
function nimMax(a_1480821, b_1480822) {
    var Tmp1;

  var result_1480823 = 0;

  BeforeRet: do {
    if ((b_1480822 <= a_1480821)) {
    Tmp1 = a_1480821;
    }
    else {
    Tmp1 = b_1480822;
    }
    
    result_1480823 = Tmp1;
    break BeforeRet;
  } while (false);

  return result_1480823;

}
function nimMin(a_1480803, b_1480804) {
    var Tmp1;

  var result_1480805 = 0;

  BeforeRet: do {
    if ((a_1480803 <= b_1480804)) {
    Tmp1 = a_1480803;
    }
    else {
    Tmp1 = b_1480804;
    }
    
    result_1480805 = Tmp1;
    break BeforeRet;
  } while (false);

  return result_1480805;

}
function mnewString(len_1480044) {
        return new Array(len_1480044);
  

  
}
function chckRange(i_1505016, a_1505017, b_1505018) {
      var Tmp1;

  var result_1505019 = 0;

  BeforeRet: do {
      if (!(a_1505017 <= i_1505016)) Tmp1 = false; else {        Tmp1 = (i_1505016 <= b_1505018);      }    if (Tmp1) {
    result_1505019 = i_1505016;
    break BeforeRet;
    }
    else {
    raiseRangeError();
    }
    
  } while (false);

  return result_1505019;

}
    var FormatOpen_1790607 = [makeNimstrLit("rb"), makeNimstrLit("wb"), makeNimstrLit("w+b"), makeNimstrLit("r+b"), makeNimstrLit("ab")];
var globalRaiseHook_1377018 = [null];
var localRaiseHook_1377023 = [null];
var outOfMemHook_1377026 = [null];
var unhandledExceptionHook_1377031 = [null];
var envComputed_10795810 = [false];
var environment_10795812 = [[]];
function newSeq_1475128(len_1475131) {
  var result_1475133 = [];

    result_1475133 = new Array(len_1475131); for (var i=0;i<len_1475131;++i) {result_1475133[i]=null;}
  return result_1475133;

}
function isFatPointer_1485401(ti_1485403) {
  var result_1485404 = false;

  BeforeRet: do {
    result_1485404 = !((ConstSet1[ti_1485403.base.kind] != undefined));
    break BeforeRet;
  } while (false);

  return result_1485404;

}
function nimCopyAux(dest_1490028, src_1490029, n_1490031) {
    switch (n_1490031.kind) {
    case 0:
      break;
    case 1:
            dest_1490028[n_1490031.offset] = nimCopy(dest_1490028[n_1490031.offset], src_1490029[n_1490031.offset], n_1490031.typ);
    
      break;
    case 2:
          for (var i = 0; i < n_1490031.sons.length; i++) {
      nimCopyAux(dest_1490028, src_1490029, n_1490031.sons[i]);
    }
    
      break;
    case 3:
            dest_1490028[n_1490031.offset] = nimCopy(dest_1490028[n_1490031.offset], src_1490029[n_1490031.offset], n_1490031.typ);
      for (var i = 0; i < n_1490031.sons.length; ++i) {
        nimCopyAux(dest_1490028, src_1490029, n_1490031.sons[i][1]);
      }
    
      break;
    }

  
}
function add_1377042(x_1377045, x_1377045_Idx, y_1377046) {
          if (x_1377045[x_1377045_Idx] === null) { x_1377045[x_1377045_Idx] = []; }
      var off = x_1377045[x_1377045_Idx].length;
      x_1377045[x_1377045_Idx].length += y_1377046.length;
      for (var i = 0; i < y_1377046.length; ++i) {
        x_1377045[x_1377045_Idx][off+i] = y_1377046.charCodeAt(i);
      }
    

  
}
function unhandledException(e_1435059) {
    var buf_1435060 = [[]];
    if (!(((e_1435059.message).length == 0))) {
    buf_1435060[0].push.apply(buf_1435060[0], makeNimstrLit("Error: unhandled exception: "));;
    buf_1435060[0].push.apply(buf_1435060[0], e_1435059.message);;
    }
    else {
    buf_1435060[0].push.apply(buf_1435060[0], makeNimstrLit("Error: unhandled exception"));;
    }
    
    buf_1435060[0].push.apply(buf_1435060[0], makeNimstrLit(" ["));;
    add_1377042(buf_1435060, 0, e_1435059.name);
    buf_1435060[0].push.apply(buf_1435060[0], makeNimstrLit("]\x0A"));;
    var cbuf_1440201 = toJSStr(buf_1435060[0]);
    framePtr = null;
      if (typeof(Error) !== "undefined") {
    throw new Error(cbuf_1440201);
  }
  else {
    throw cbuf_1440201;
  }
  

  
}
function raiseIndexError(i_1460047, a_1460048, b_1460049) {
    var Tmp1;

    if ((b_1460049 < a_1460048)) {
    Tmp1 = makeNimstrLit("index out of bounds, the container is empty");
    }
    else {
    Tmp1 = (makeNimstrLit("index ") || []).concat(cstrToNimstr((i_1460047)+"") || [],makeNimstrLit(" not in ") || [],cstrToNimstr((a_1460048)+"") || [],makeNimstrLit(" .. ") || [],cstrToNimstr((b_1460049)+"") || []);
    }
    
    raiseException({message: nimCopy(null, Tmp1, NTI1208013), parent: null, m_type: NTI1214649, name: null, trace: [], up: null}, "IndexDefect");

  
}
function raiseOverflow() {
    raiseException({message: makeNimstrLit("over- or underflow"), parent: null, m_type: NTI1214637, name: null, trace: [], up: null}, "OverflowDefect");

  
}
function checkOverflowInt(a_1480403) {
        if (a_1480403 > 2147483647 || a_1480403 < -2147483648) raiseOverflow();
  

  
}
function sysFatal_1325418(message_1325422) {
    raiseException({message: nimCopy(null, message_1325422, NTI1208013), m_type: NTI1214641, parent: null, name: null, trace: [], up: null}, "AssertionDefect");

  
}
function raiseAssert_1325414(msg_1325416) {
    sysFatal_1325418(msg_1325416);

  
}
function failedAssertImpl_1325480(msg_1325482) {
    raiseAssert_1325414(msg_1325482);

  
}
function setOptions_11030100(ctx_11030103, precision_11030104, outputStyle_11030105, includePaths_11030106, outputPath_11030107) {
    var opts_11030108 = sass_file_context_get_options(ctx_11030103);
    sass_option_set_precision(opts_11030108, precision_11030104);
    sass_option_set_output_style(opts_11030108, outputStyle_11030105);
    L1: do {
      var p_11030116 = null;
      var p_11030116_Idx = 0;
      var i_11041033 = 0;
      var L_11041034 = (includePaths_11030106).length;
      L2: do {
          L3: while (true) {
          if (!(i_11041033 < L_11041034)) break L3;
            p_11030116 = includePaths_11030106; p_11030116_Idx = chckIndx(i_11041033, 0, (includePaths_11030106).length-1);
            var allocatedData_11030117 = strdup(toJSStr(p_11030116[p_11030116_Idx]));
            sass_option_push_include_path(opts_11030108, allocatedData_11030117);
            i_11041033 = addInt(i_11041033, 1);
            if (!(((includePaths_11030106).length == L_11041034))) {
            failedAssertImpl_1325480(makeNimstrLit("iterators.nim(204, 11) `len(a) == L` the length of the seq changed while iterating over it"));
            }
            
          }
      } while(false);
    } while(false);
    if ((0 < (outputPath_11030107).length)) {
    sass_option_set_output_path(opts_11030108, toJSStr(outputPath_11030107));
    }
    

  
}
function searchExtPos_10720033(path_10720035) {
  var result_10720036 = 0;

    result_10720036 = -1;
    L1: do {
      var i_10720043 = 0;
      var colontmp__11041049 = 0;
      colontmp__11041049 = subInt((path_10720035).length, 1);
      var res_11041054 = colontmp__11041049;
      L2: do {
          L3: while (true) {
          if (!(1 <= res_11041054)) break L3;
            i_10720043 = res_11041054;
            if ((path_10720035[chckIndx(i_10720043, 0, (path_10720035).length-1)] == 46)) {
            result_10720036 = i_10720043;
            break L1;
            }
            else {
            if ((ConstSet2[path_10720035[chckIndx(i_10720043, 0, (path_10720035).length-1)]] != undefined)) {
            break L1;
            }
            }
            res_11041054 = subInt(res_11041054, 1);
          }
      } while(false);
    } while(false);

  return result_10720036;

}
function normExt_10720014(ext_10720016) {
  var result_10720017 = [];

    if ((eqStrings(ext_10720016, []) || (ext_10720016[chckIndx(0, 0, (ext_10720016).length-1)] == 46))) {
    result_10720017 = nimCopy(null, ext_10720016, NTI1208013);
    }
    else {
      result_10720017 = nimCopy(null, [46].concat(ext_10720016 || []), NTI1208013);
    }
    

  return result_10720017;

}
function raiseRangeError() {
    raiseException({message: makeNimstrLit("value out of range"), parent: null, m_type: NTI1214653, name: null, trace: [], up: null}, "RangeDefect");

  
}
function substr_1591022(s_1591024, first_1591025, last_1591026) {
  var result_1591027 = [];

    var first_1591028 = nimMax(first_1591025, 0);
    var L_1591030 = nimMax(addInt(subInt(nimMin(last_1591026, ((s_1591024).length-1)), first_1591028), 1), 0);
    result_1591027 = nimCopy(null, mnewString(chckRange(L_1591030, 0, 2147483647)), NTI1208013);
    L1: do {
      var i_1591039 = 0;
      var colontmp__11041060 = 0;
      colontmp__11041060 = subInt(L_1591030, 1);
      var res_11041061 = 0;
      L2: do {
          L3: while (true) {
          if (!(res_11041061 <= colontmp__11041060)) break L3;
            i_1591039 = res_11041061;
            result_1591027[chckIndx(i_1591039, 0, (result_1591027).length-1)] = s_1591024[chckIndx(addInt(i_1591039, first_1591028), 0, (s_1591024).length-1)];
            res_11041061 = addInt(res_11041061, 1);
          }
      } while(false);
    } while(false);

  return result_1591027;

}
function noschangeFileExt(filename_10770056, ext_10770057) {
  var result_10770058 = [];

    var extPos_10770059 = searchExtPos_10720033(filename_10770056);
    if ((extPos_10770059 < 0)) {
    result_10770058 = nimCopy(null, (filename_10770056 || []).concat(normExt_10720014(ext_10770057) || []), NTI1208013);
    }
    else {
      result_10770058 = nimCopy(null, (substr_1591022(filename_10770056, 0, subInt(extPos_10770059, 1)) || []).concat(normExt_10720014(ext_10770057) || []), NTI1208013);
    }
    

  return result_10770058;

}
function open_1790829(f_1790832, f_1790832_Idx, filename_1790833, mode_1790834, bufSize_1790835) {
    var Tmp1;
      var Tmp2;

  var result_1790836 = false;

    var p_1790837 = (Tmp1 = fopen(toJSStr(filename_1790833), toJSStr(FormatOpen_1790607[chckIndx(mode_1790834, 0, (FormatOpen_1790607).length-1)])), Tmp1)[0], p_1790837_Idx = Tmp1[1];
    if (!((p_1790837 == null && p_1790837_Idx == 0))) {
    var f2_1795001 = p_1790837;
    result_1790836 = true;
    f_1790832[f_1790832_Idx] = p_1790837;
      if (!(0 < bufSize_1790835)) Tmp2 = false; else {        Tmp2 = (bufSize_1790835 <= 2147483647);      }    if (Tmp2) {
    setvbuf(f_1790832[f_1790832_Idx], null, 0, _IOFBF, (bufSize_1790835 >>> 0));
    }
    else {
    if ((bufSize_1790835 == 0)) {
    setvbuf(f_1790832[f_1790832_Idx], null, 0, _IONBF, 0);
    }
    }
    }
    

  return result_1790836;

}
function raiseEIO_1712419(msg_1712421) {
    raiseException({message: nimCopy(null, msg_1712421, NTI1208013), parent: null, m_type: NTI1214623, name: null, trace: [], up: null}, "IOError");

  
}
function checkErr_1730214(f_1730216) {
    if (!((ferror(f_1730216) == 0))) {
    var msg_1735001 = (makeNimstrLit("errno: ") || []).concat(cstrToNimstr((((errno)|0))+"") || [],makeNimstrLit(" `") || [],cstrToNimstr(strerror(errno)) || [],makeNimstrLit("`") || []);
    clearerr(f_1730216);
    raiseEIO_1712419(msg_1735001);
    }
    

  
}
function writeBuffer_1745051(f_1745053, buffer_1745054, buffer_1745054_Idx, len_1745055) {
  var result_1745056 = 0;

    result_1745056 = (fwrite(buffer_1745054, buffer_1745054_Idx, 1, (len_1745055 >>> 0), f_1745053) >>> 0);
    checkErr_1730214(f_1745053);

  return result_1745056;

}
function write_1745214(f_1745216, s_1745217) {
    if (!((writeBuffer_1745051(f_1745216, toJSStr(s_1745217), chckRange((s_1745217).length, 0, 2147483647)) == (s_1745217).length))) {
    raiseEIO_1712419(makeNimstrLit("cannot write string to file"));
    }
    

  
}
function close_1750416(f_1750418) {
    if (!((f_1750418 == null))) {
    fclose(f_1750418);
    }
    

  
}
function writeFile_1835015(filename_1835017, content_1835018) {
    var Tmp2;

    var f_1835019 = [null];
    if (open_1790829(f_1835019, 0, filename_1835017, 1, -1)) {
    Tmp2 = framePtr;
    try {
    write_1745214(f_1835019[0], content_1835018);
    } finally {
    framePtr = Tmp2;
    close_1750416(f_1835019[0]);
    }
    }
    else {
      raiseException({message: (makeNimstrLit("cannot open: ") || []).concat(filename_1835017 || []), parent: null, m_type: NTI1214623, name: null, trace: [], up: null}, "IOError");
    }
    

  
}
function compileFile_11030075(filename_11030077, outputPath_11030078, precision_11030079, outputStyle_11030080, includePaths_11030097) {
    var Tmp2;
    var Tmp3;

    var allocatedFilename_11030098 = strdup(toJSStr(filename_11030077));
    var fileCtx_11030099 = sass_make_file_context(allocatedFilename_11030098);
    Tmp2 = framePtr;
    try {
    setOptions_11030100(fileCtx_11030099, precision_11030079, outputStyle_11030080, includePaths_11030097, outputPath_11030078);
    var ctx_11030131 = sass_file_context_get_context(fileCtx_11030099);
    if (!((sass_compile_file_context(fileCtx_11030099) == 0))) {
    raiseException({message: cstrToNimstr(sass_context_get_error_text(ctx_11030131)), parent: null, m_type: NTI11012028, name: null, trace: [], up: null}, "SassException");
    }
    
    if (((outputPath_11030078).length == 0)) {
    Tmp3 = noschangeFileExt(filename_11030077, makeNimstrLit("css"));
    }
    else {
    Tmp3 = outputPath_11030078;
    }
    
    var outputPath_11040002 = nimCopy(null, Tmp3, NTI1208013);
    writeFile_1835015(outputPath_11040002, cstrToNimstr(sass_context_get_output_string(ctx_11030131)));
    } finally {
    framePtr = Tmp2;
    sass_delete_file_context(fileCtx_11030099);
    }

  
}
compileFile_11030075(makeNimstrLit("styles/index.scss"), [], 5, 0, []);