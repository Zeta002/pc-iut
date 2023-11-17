/**
 *
 * @File : nsUtil.h
 *
 * @Authors : D. Mathieu, M. Laporte
 *
 * @Date : 18/10/2002
 *
 * @Version : V1.0
 * @Author : A. B. Dragut
 *
 * @Synopsis : FileCopy() : profil de la fonction de copie
 *                          d'un fichier par paquets d'octets 
 *                          avec possibilité d'écriture immédiate
 *
 **/
#if ! defined __NSUTIL_H__
#define       __NSUTIL_H__

#include <cstddef>       //  size_t

#include "CException.hpp"  // CExcFct

namespace nsUtil
{
   /* void FileCopy (const char * const Destination,  
	               const char * const Source, 
                   const std::size_t NbBytes, 
				   const bool Immediat = false) 
                       throw (CExcFct);*/

} // nsUtil

#endif    /*  __NSUTIL_H__ */
