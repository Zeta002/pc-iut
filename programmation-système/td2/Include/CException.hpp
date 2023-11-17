/**
 *
 * @File : CException.h
 *
 * @Authors : M. Laporte, M. Mathieu
 *
 * @Date : 18/10/2002
 *
 * @Version : V1.0
 * @Author : A. B. Dragut
 *
 * @Synopsis : déclarations des classes CException et CExcFct
 *
 **/
#if !defined __CEXCEPTION_H__
#define      __CEXCEPTION_H__

#include <exception>
#include <string>
#include <iostream>

#include "CEditable.hpp"
#include "CstCodErr.h"

namespace nsUtil
{
    class CException : public std::exception, public CEditable
    {
      protected :
        std::string m_Libelle;
        int         m_CodErr;

      public :

        CException (const std::string & Libelle  = std::string ()  ,
                          int           CodErr   = std::CstNoError )
                                                              noexcept;
        virtual ~CException (void)                            noexcept;

        int                  GetCodErr  (void) const          noexcept;
        const std::string &  GetLibelle (void) const          noexcept;

        virtual const char * what       (void) const          noexcept;

      protected :
        virtual std::ostream & _Edit (std::ostream & os) const; 
    
    }; // CException

    class CExcFct : public CException
    {
      public :
        CExcFct (const std::string & NomFonction,
                 int                 CodErr /* = std::CstNoError */)
                                                               noexcept;
        virtual ~CExcFct (void)                               noexcept;

    }; // CExcFct

} // nsUtil

#define CEXCEPT nsUtil::CException

inline
CEXCEPT::CException 
    (const std::string & Libelle /* = std::string ()  */,
           int           CodErr  /* = std::CstNoError */) noexcept
    : m_Libelle (Libelle), m_CodErr (CodErr)   {}

inline
 CEXCEPT::~CException (void) noexcept {} 

inline
 const char * CEXCEPT::what (void) const noexcept 
{ 
    return m_Libelle.c_str();

} // what()

inline
 int CEXCEPT::GetCodErr (void) const noexcept
{
     return m_CodErr;

} // GetCodErr()

 inline
const std::string & CEXCEPT::GetLibelle (void) const noexcept 
{ 
    return m_Libelle; 

}  // GetLibelle()

#undef CEXCEPT

//===============
// Classe CExcFct
//===============

#define CEXCFCT nsUtil::CExcFct

 inline
CEXCFCT::CExcFct
    (const std::string & NomFonction,
           int           CodErr  /* = std::CstNoError */) noexcept
    : CException (std::string ("Erreur fonction ") + NomFonction,
	              CodErr) {}
inline
 CEXCFCT::~CExcFct (void) noexcept {} 

#undef CEXCFCT
    
//#include "CException.hxx"

#endif    /* __CEXCEPTION_H__ */
