/**
 *
 * @File : CstCodErr.h
 *
 * @Authors : D. Mathieu, M. Laporte
 *
 * @Date : 25/07/2001
 *
 * @Version : V1.0
 * @Author : A. B. Dragut
 *
 * @Synopsis : tous les codes d'erreurs non système
 *
 **/
#if ! defined __CSTCODERR_H__
#define       __CSTCODERR_H__

namespace std
{
    enum { 
        CstNoError      = 0,
        CstNoExc        = 0,
	CstTailleChoix  = 133,

        CstOpenArgMoins = 129, // pas assez d'args a la fonction Open()
        CstOpenArgPlus  = 130, // trop      d'args a la fonction Open()
	CstSigSaved     = 131, // tentative de sauvegarder des traitants
                               // de signaux deja sauvegardes
	CstSigNotSaved  = 132, // tentative de restaurer des traitants
                               // de signaux non sauvegardes

        CstExcArg       = 253, // nombre d'args de la commande errone
        CstExcStd       = 254, // exception standard
        CstExcInconnue  = 255, // exception inconnue

     };

} // namespace std

#endif        /* __CSTCODERR_H__ */
