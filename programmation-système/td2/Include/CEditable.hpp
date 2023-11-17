/**
 *
 * @File : CEditable.h
 *
 * @Authors : D. Mathieu
 *            M. Laporte
 *
 * @Date : 03/03/2000
 *
 * @Author : A. B. Dragut
 * @Version : V2.0
 *
 * @Synopsis : déclaration de la classe CEditable dans nsUtil
 *
 **/
#if !defined __CEDITABLE_H__
#define      __CEDITABLE_H__

#include <iostream>

namespace nsUtil
{
    class CEditable
    {
      protected :
        virtual std::ostream & _Edit (std::ostream & os) const = 0;
    
      public :
        virtual ~CEditable (void) noexcept;
        friend std::ostream & operator << (std::ostream & os, 
                                           const CEditable & Obj);
    }; // CEditable
    std::ostream & operator << (std::ostream & os, 
                                const CEditable & Obj);    

} // nsUtil

inline
nsUtil::CEditable::~CEditable (void) noexcept {}

inline
std::ostream & nsUtil::operator << (std::ostream & os, 
                                    const CEditable & Obj)
{
    return Obj._Edit (os);

} // operator <<

#endif     /* __CEDITABLE_H__ */

