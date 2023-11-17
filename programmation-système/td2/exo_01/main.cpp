#include <iostream>
#include "../Include/nsSysteme.h"
#include "../Include/CException.hpp"

#include <fcntl.h>


using namespace nsSysteme; // wrappers système
using namespace std;
using namespace nsUtil; //CException





int ppal () {
//    string nomFichier ("Makefile");
//    struct stat S;
//    Stat (nomFichier.c_str(), &S);
//    cout << "taille : " << S.st_size << "o" << endl;
//    if ((S.st_mode & S_IFMT) == S_IFREG)
//        cout << "fichier standard" << endl;
//    nomFichier = "tmp.txt";
//    int fd = Open (nomFichier.c_str(), O_RDONLY);
//    cout <<" Descripteur num : " << fd << endl;
//    Fstat (fd, & S);
//    cout << "taille : " << S.st_size  << endl;
//    Close (fd);
//    Close (0);
//    Close (1);
//    cin >> nomFichier ;
//    cout << nomFichier << endl;
//    cout << "kjlfgrkljeh" << endl;
    const int fdSource = Open ("Makefile",O_RDONLY);
    const int fdDest = Open ( "MakefileCopy", O_WRONLY| O_CREAT , 0600);
    const size_t NbBytes =512; char Tampon [NbBytes];
    size_t NbLus =0;
    while ((NbLus = Read (fdSource, Tampon , NbBytes)) > 0){
    Write (fdDest, Tampon, NbLus);
    }
    Close (fdSource); Close (fdDest);
    return 0;
} // ppal ()

int main () {
    try {
        //ppal == programme principal
        return ppal ();
    }
    catch (const CException & Exc) {
        cerr << Exc << endl;
        return errno;
    }
    catch (const exception & Exc) {
        cerr << "Exception : " << Exc.what () << endl;
        return CstExcStd;
    }
    catch (...) {
        cerr << "Exception inconnue recue dans la fonction main()" << endl;
        return CstExcInconnue;
    }
}// main()
