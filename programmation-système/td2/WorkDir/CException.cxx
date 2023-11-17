/**
 *
 * @File : CException.cxx
 *
 * @Authors : M. Laporte, D. Mathieu
 *
 * @Date : 22/10/2002
 *
 * @Version : V1.0
 * @Author : A. B. Dragut
 *
 * @Synopsis : 
 *
 **/
#include <iostream>

#include "../Include/CException.hpp"

#define CEXCEPT nsUtil::CException

std::ostream & CEXCEPT::_Edit (std::ostream & os) const
{
    return os << "\nException     : " << m_Libelle 
              << "\nCode d'erreur : " << m_CodErr;

} // _Edit()

#undef    CEXCEPT
