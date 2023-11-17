/**
 *
 * @File : nsSysteme.h
 * 2011
 * @Synopsis : espace de noms qui contient les prototypes des wrappers
 *             des fonctions systeme
 *
 *
 **/
#if !defined __NSSYSTEME_H__
#define      __NSSYSTEME_H__

#include <cstddef>        // size_t

#include <sys/types.h>    // ssize_t

#include <sys/stat.h>     // struct stat, stat(), fstat()
#include <signal.h>

#include "CException.hpp"

//  Declarations des fonctions concernant les fichiers
//  =========================================================

namespace nsSysteme
{
void        Stat    (const char * file_name, struct stat * buf);

void Fstat (int fd, struct stat * buf);
void        Close  (int fd);


int         Open   (const char * pathname, int flags);
int         Open   (const char * pathname, int flags, ::mode_t mode);
ssize_t Read   (int fd, void * buf, size_t count);
ssize_t Write(int fd, const void *buf, size_t count);
sighandler_t Signal(int signum, sighandler_t handler);
int Sigaction(int signum, const struct sigaction * act,
              struct sigaction * oldact);
int Sigemptyset(sigset_t *set);
int Sigaddset(sigset_t *set, int signo);

pid_t Fork(void);
int System(const char *command);
int Kill(pid_t pid, int sig);
} // nsSysteme


#endif    /* __NSSYSTEME_H__ */

